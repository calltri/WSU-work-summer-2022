# Name: Madison Call
# Date: 12/8/2022
# Description: Looks at an excel sheet. Converts data from form:
#           g1  g2  g3  g4
# strain1   b   c   NA  NA
# strain2   a   b   c   d
# to form:
#           a   b   c   d
# strain1   0   1   1   0
# strain2   1   1   1   1
#
# Essentially it creates a matrix of what genes each strain has
# writes to a csv. 
# How to use: Go to every INSERT in the file and fill out the info appropriately

library(dplyr)
library(readxl)
library(data.table)
library(rlang)

#INSERT file locations here! Make sure to use /
# Also use the complete file path
# Put path to the file with all relevant data. Should be a xlsx file 
# You could also use a csv if you switched read_excel() to read.csv()
data_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/groupby_testing/Final Virulence Results 12082022...[92].xlsx"
# INSERT Desination route to end file
# Make sure it is file with .csv
destination_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/groupby_testing/matrix_output.csv"

data <- read_excel(data_file)
data <- as.data.frame(t(data))

# find all unique genes in the data
gene_names <- c()
for (row in data[- (1:1),- (1:1)]) {
  gene_names <- append(gene_names, c(row))
}
gene_names <- unique(gene_names)
# Remove NAs
gene_names <- gene_names[! gene_names %in% c(NA)]
max_len = length(gene_names)

# Create Table
new_table <- data.frame(vector(mode="logical", length=max_len), row.names=gene_names)
strain_names <- c()
for (strain_with_name in data) {
  strain = strain_with_name[- (1)]
  strain_name = strain_with_name[1]
  # When reach end of rows exit loop
  if (is.na(strain_name)) break
  list_strains = c()
  for (gene in gene_names) {
    if (gene %in% strain) {
      list_strains <- append(list_strains, 1)
    }
    else {
      list_strains <- append(list_strains, 0)
    }
  }
  strain_names <- append(strain_names, strain_name)
  new_table[strain_name] <- list_strains
}
#Prep and send data to csv
new_table <- new_table[,- (1)]
new_table <- t(new_table)
row.names(new_table) <- strain_names
colnames(new_table) <- gene_names
write.csv(new_table, destination_file)

