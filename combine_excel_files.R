# Combines all the data from excel files in a folder to a given desination
# 

install.packages("readxl")
library(readxl)

all_files <- list.files("C:/Users/madis/Desktop/WSU work summer 2022/test_file_combine/test_files", all.files=FALSE,
                        full.names=TRUE)
print(all_files)
combined_file <- "C:/Users/madis/Desktop/WSU work summer 2022/test_file_combine/combined_files.csv"

first_run = TRUE
for (file in all_files) {
  data <- read_excel(file)
  # If first run overwrites data and includes row names
  write.table(data, file = combined_file, sep = ',', append = !first_run, col.names = first_run, row.names = FALSE)
  if (first_run) {
    first_run <- FALSE
  }
}
