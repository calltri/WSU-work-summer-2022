# Name: Madison Call
# Date: 6/16/2022
# Description: Grabs the list of nodes to search from a csv file, then collects all the relevant 
# sequences from fasta files in a given file location
# All file should be of the same type, no automatic checks for this exist

install.packages("seqinr")
install.packages("rlist")
library(seqinr)
library(rlist)

# INSERT HERE
combined_csv_file <- "C:/Users/madis/Desktop/WSU work summer 2022/test_file_combine/combined_files.csv"
fasta_file_location <- "C:/Users/madis/Desktop/WSU work summer 2022"
# NO MORE TOUCHING

# Read csv and get list of nodes to search for
csv_file = read.csv(combined_csv_file)
nodes_to_search <- csv_file["money"]

# Get all fasta files to search
all_fasta_files <- list.files(fasta_file_location, all.files=FALSE,
                        full.names=TRUE)

# Search fasta files for the nodes
all_sequences <- c()
for(fasta_file in all_fasta_files) {
  sequences <- read.fasta(fasta_file)
  for(search_node in nodes_to_search) {
    file_name <- "C:/Users/madis/Desktop/WSU work summer 2022/10433wA1_M2A1.fasta"
    
    search_node <- "NODE_4_length_294847_cov_30.3947"
    result <- sequences[search_node]
    if (!list(NULL) %in% result) {
      all_sequences <- c(all_sequences, result)
    }
  }
}

write.fasta(all_sequences, names=names(all_sequences), open = "w", file.out="C:/Users/madis/Desktop/WSU work summer 2022/test_combine.fasta")





