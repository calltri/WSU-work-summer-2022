# Name: Madison Call
# Date: 6/16/2022
# Description: Looks at an excel sheet, groups the data by ID, fills out any
# empty locations with null values, converts to a table with the form 
# 'ID, val1, val2,...' and writes to a csv. Repeats the process for all 
# Columns other than ID

library(dplyr)
library(readxl)
library(data.table)
library(rlang)

#INSERT file locations here! Make sure to use /
# Put path to the folder that should hold the files to combine
excel_data_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/groupby_testing/data.xlsx"
# Put file that should all files should be combined into
# Make sure is file with .csv
destination_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/groupby_testing/output.csv"


data <- read_excel(excel_data_file)

# INSERT the below line should be in the format:
# split_data <- with(data, split(<The column you want to split with>, list(ID)))
split_data <- with(data, split(Data2, list(ID)))

max_len = 0
for (row in split_data) {
  len = length(row)
  if(len > max_len) {
    max_len = len
  }
}

for (row_num in 1:length(split_data)) {
  row = unlist(split_data[row_num])
  while(TRUE) {
    if (length(row) == max_len) {
      break
    }
    row <- c(row, "NULL")
  }
  split_data[row_num] <-list(row)
}

row_names <- names(split_data)
split_data <- t(data.frame(split_data))
row.names(split_data) <- row_names
write.csv(split_data, destination_file)

