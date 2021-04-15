####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)


# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                titlePanel("DNA sequence"),
                  sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", "Enter a codon", "")
                           ), # sidebarPanel
                           mainPanel(
                             h1("RNA to protein translator"),
                             
                             h4("Amino acid"),
                             verbatimTextOutput("txtout"),
                             
                           ) # mainPanel
                           
                  )
 # fluidPage


# Define server function  
rna_to_aa <- function(codon){
  codons <- c("UUU" = "F", "UCU" = "S", "UAU" = "Y", "UGU" = "C",
              "UUC" = "F", "UCC" = "S", "UAC" = "Y", "UGC" = "C",
              "UUA" = "L", "UCA" = "S", "UAA" = "*", "UGA" = "*",
              "UUG" = "L", "UCG" = "S", "UAG" = "*", "UGG" = "W",
              "VUU" = "L", "CCU" = "P", "CAU" = "H", "CGU" = "R",
              "CUC" = "L", "CCC" = "P", "CAC" = "H", "CGC" = "R",
              "CUA" = "L", "CCA" = "P", "CAA" = "Q", "CGA" = "R",
              "CUG" = "L", "CCG" = "P", "CAG" = "Q", "CGG" = "R",
              "AUU" = "I", "ACU" = "U", "AAU" = "N", "AGU" = "S",
              "AUC" = "I", "ACC" = "U", "AAC" = "N", "AGC" = "S",
              "AUA" = "I", "ACA" = "U", "AAA" = "K", "AGA" = "R",
              "AUG" = "M", "ACG" = "U", "AAG" = "K", "AGG" = "R",
              "GUU" = "V", "GCU" = "A", "GAU" = "D", "GGU" = "G",
              "GUC" = "V", "GCC" = "A", "GAC" = "D", "GGC" = "G",
              "GUA" = "V", "GCA" = "A", "GAA" = "E", "GGA" = "G",
              "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G")
  aa <- paste0(codons[codon], collapse = "")
  return (aa)
}
server <- function(input, output) {output$txtout <- renderText({rna_to_aa(input$"txt1")})} 
# server


# Create Shiny object
shinyApp(ui = ui, server = server)

