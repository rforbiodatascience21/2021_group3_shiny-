####################################
#    R for Bio Data ScienceGroup3  #
#              Group 3             #
####################################

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)
library(tidyverse)
library(ggpubr)
# loading gravier data 
#setwd("~/Desktop/Universitet/DTU/Bioinformatik_og_System_Biologi/1.Semester/R_for_BioScience/2021_group3_shiny-")
gravier_data <- read_csv("cancer_data_gravier.csv")

# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage("Gravier et al. (2010) EDA",
                           tabPanel("Density of gene expression",
                                    sidebarPanel(selectInput("gene",
                                                             "Gene: ",
                                                             choices=colnames(gravier_data)),
                                                 selectInput("gene2",
                                                             "Gene 2",
                                                             choices=colnames(gravier_data)),
                                                 helpText("Select two genes and get the pairwise
                                                          correlation.")),
                plotOutput("scatterplot")),
                
                tabPanel("Plot", "Plot",
                         sidebarPanel(selectInput("gene3",
                                                  "Gene: ",
                                                  choices=colnames(gravier_data)),
                                      selectInput("patient",
                                                  "Patient ID",
                                                  choices=rownames(gravier_data))),
                         plotOutput("hist_plot")),
                
                
                tabPanel("About", "Description:
                         Gravier et al. (2010) have considered small, invasive ductal
                         carcinomas without axillary lymph node involvement (T1T2N0)
                         to predict metastasis of small node-negative breast carcinoma.
                         Using comparative genomic hybridization arrays, they examined 168
                         patients over a five-year period. The 111 patients with no event
                         after diagnosis were labelled good, and the 57 patients with early
                         metastasis were labelled poor.
                         ")
))

# Define server function  
server <- function(input, output) {
  output$scatterplot <- renderPlot({
    plot1 <- ggplot(data = gravier_data,
                    mapping = aes_string(x = input$"gene",
                                         y = input$"gene2")) +
      geom_point() +
      geom_smooth(method = lm) +
      theme_minimal() +
      theme(plot.title = element_text(size = 24))+ 
      labs(title = "Pairwise coreleation between expression levels of two genes")
      plot1 + stat_cor(method = "pearson", label.x = 3, label.y = 30)
    plot(plot1) 
    })
  output$hist_plot <- renderPlot({
    plot2 <- ggplot(data = gravier_data,
                    mapping = aes_string(x = input$"patient",
                                  y = input$"gene3")) +
                      geom_point()
    plot(plot2) 
    })
}


# Create Shiny object
shinyApp(ui = ui, server = server)




