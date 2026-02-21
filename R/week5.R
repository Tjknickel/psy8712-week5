# Script Settings and Resources 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import 
Adata_tbl <- read_delim(file = "../data/Aparticipants.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
Anotes_tbl <- read_csv(file = "../docs/Anotes.csv")
Bdata_tbl <- read_delim(file = "../data/Bparticipants.dat", delim = "\t", col_names = c("casenum", "parnum", "stimver", "datadate", paste0("q", 1:10))) 
Bnotes_tbl <- read_delim(file = "../docs/Bnotes.txt", delim = "\t")

# Data Cleaning 
Aclean_tbl <- Adata_tbl %>% 
   separate(col = qs, into = paste0("q", 1:5), sep = "-") %>%
   mutate(datadate = mdy_hms(datadate)) %>%
   mutate(across(q1:q5, as.integer)) %>%
   inner_join(Anotes_tbl, by = "parnum") %>%
   filter(is.na(notes))