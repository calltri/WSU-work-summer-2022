# Name: Madison Call
# Date: 6/16/2022
# Description: Combines all the data from excel files in a folder to a given destination
# Keeps the column headers from the first file only
# All file should be of the same type, no checks for this exist
 

install.packages("readxl")
library(readxl)

#INSERT file locations here!
# Put path to the folder that should hold the files to combine
files_to_combine_location <- "C:/Users/madis/Desktop/WSU work summer 2022/test_file_combine/test_files"
# Put file that should all files should be combined into
combined_file <- "C:/Users/madis/Desktop/WSU work summer 2022/test_file_combine/combined_files.csv"

all_files <- list.files(files_to_combine_location, all.files=FALSE,
                        full.names=TRUE)

print(all_files)

first_run = TRUE
for (file in all_files) {
  data <- read_excel(file)
  # If first run overwrites data and includes row names
  write.table(data, file = combined_file, sep = ',', append = !first_run, col.names = first_run, row.names = FALSE)
  if (first_run) {
    first_run <- FALSE
  }
}
