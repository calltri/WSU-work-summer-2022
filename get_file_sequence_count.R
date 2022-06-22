# Name: Madison Call
# Date: 6/21/2022
# Description: Goes through a folder of fasta files and prints out the file name
# and how many nodes are present in it

install.packages("seqinr")
install.packages("rlist")
install.packages("readxl")
library(seqinr)
library(rlist)
library(readxl)

# INSERT HERE
# Make sure to use "/" and include .fasta (but not for the file location)

final_destination <- "C:/Users/ridwan.adesola/Desktop/ALIGNMENT RESFINDER/genome_count_by_file.txt"
fasta_file_location <- "C:/Users/ridwan.adesola/Desktop/TANZANIA SEQUENCES/Resfinder Zadoks_New"
# NO MORE TOUCHING

# Get all fasta files to search
setwd(fasta_file_location)
all_fasta_files <- list.files(fasta_file_location, all.files=FALSE,
                              full.names=FALSE, pattern=".fasta")
# Search fasta files for the nodes
file_lengths = ""
total_sequences = 0
first_run = TRUE
for(fasta_file in all_fasta_files) {
  #print(found_sequences)
  
  sequences <- read.fasta(fasta_file)
  len = length(sequences)
  total_sequences = total_sequences + len
  output_text <- paste("Length of file '", fasta_file, "' is: ", len, "/n")
  print(output_text)
  file_lengths <- c(file_lengths, output_text)
}
output_text <- paste("Total sequences in folder: ", total_sequences)
print(output_text)
file_lengths <- c(file_lengths, output_text)
writeLines(file_lengths, final_destination)
print("DONE!")


