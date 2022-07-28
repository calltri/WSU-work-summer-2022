# Name: Madison Call
# Date: 6/16/2022
# Description: Looks at an excel sheet, groups the data by ID, fills out any
# empty locations with null values, converts to a table with the form 
# 'ID, val1, val2,...' and writes to a csv. 
# How to use: Go to every INSERT in the file and fill out the info appropriately

library(dplyr)
library(readxl)
library(data.table)
library(rlang)

#INSERT file locations here! Make sure to use /
# Also use the complete file path
# Put path to the file with all relevant data. Should be a xlsx file 
# You could also use a csv if you switched read_excel() to read.csv()
data_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/groupby_testing/data.xlsx"
# INSERT Desination route to end file
# Make sure it is file with .csv
destination_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/groupby_testing/output.csv"


data <- read_excel(data_file)

# INSERT the below line should be in the format:
# split_data <- with(data, split(<The column who's data you want shown>, list(<The column to group on>)))
split_data <- with(data, split(Data2, list(ID)))

max_len = 0
for (row in split_data) {
  len = length(row)
  if(len > max_len) {
    max_len = len
  }
}

# Fill in rows with more dummy data
for (row_num in 1:length(split_data)) {
  row = unlist(split_data[row_num])
  while(TRUE) {
    if (length(row) == max_len) {
      break
    }
    row <- c(row, "")
  }
  split_data[row_num] <-list(row)
}

row_names <- names(split_data)
split_data <- t(data.frame(split_data))
row.names(split_data) <- row_names
colnames(split_data) <- c(1:max_len)
write.csv(split_data, destination_file)

