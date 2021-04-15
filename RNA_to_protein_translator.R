### RNA to protein translator

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

