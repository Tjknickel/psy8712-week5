# Script Settings and Resources 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import 
Adata_tbl <- read_delim(file = "../data/Aparticipants.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
Anotes_tbl <- read_csv(file = "../docs/Anotes.csv")
Bdata_tbl <- read_delim(file = "../data/Bparticipants.dat", delim = "\t", col_names = c("casenum", "parnum", "stimver", "datadate", paste0("q", 1:10))) #paste0("q", 1:10), "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"
Bnotes_tbl <- read_delim(file = "../docs/Bnotes.txt", delim = "\t")
 