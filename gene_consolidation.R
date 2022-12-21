# Name: Madison Call
# Date: 12/20/2022
# Description: Consolidates all baTem genes from the same position and strain into one gene

#TODO consolidates aac(6')-Ib-cr genes to a specific type?


library(dplyr)
library(readxl)
library(data.table)
library(rlang)

#INSERT file locations here! Make sure to use /
# Also use the complete file path
# Put path to the file with all relevant data. Should be a xlsx file 
# You could also use a csv if you switched read_excel() to read.csv()
data_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/Final Resistance Results12082022.xlsx"
# INSERT Desination route to end file
# Make sure it is file with .csv
destination_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/consolidated_results.csv"

data <- read_excel(data_file)
num_rows <- nrow(data)
old_strain <- ""
cur_strain <- ""

i <- 1
while (i <= num_rows) {
  cur_strain <- data[i,1]
  gene_name <- data[i,2]
  
  # reset logic if new strain
  if (cur_strain != old_strain) {
    old_strain <- cur_strain
    duplicate_pos <- c()
  }

  # Identify if gene is blaTEM*
  if (substr(gene_name, 1, 6) == "blaTEM") {
    gene_pos <- data[i,6]
    # If position not already recorded
    if (!(gene_pos %in% duplicate_pos)) {
      duplicate_pos <- c(duplicate_pos, gene_pos)
      data[i,2] <- "blaTEM"
    }
    else {
      # Delete row and reset counts if duplicate
      data <- data[-i,]
      i <- i - 1
      num_rows <- num_rows - 1
    }
  }
  i <- i + 1
  
}
write.csv(data, destination_file)
