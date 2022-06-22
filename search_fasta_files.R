# Name: Madison Call
# Date: 6/16/2022
# Description: Grabs the list of nodes to search from a csv file, then collects all the relevant
# sequences from fasta files in a given file location
# All file should be of the same type, no automatic checks for this exist

install.packages("seqinr")
install.packages("rlist")
install.packages("readxl")
library(seqinr)
library(rlist)
library(readxl)

# INSERT HERE
combined_csv_file <- "C:/Users/madis/Desktop/WSU work summer 2022/test_file_combine/combined_files_excel.xlsx"
fasta_file_location <- "C:/Users/madis/Desktop/WSU work summer 2022/fasta_files"
final_destination <- "C:/Users/madis/Desktop/WSU work summer 2022/test_combine.fasta"

#combined_csv_file <- "C:/Users/ridwan.adesola/Desktop/RESFINDER RESULT/CALL COMBINED/10433wA10_M2A10 (Find resistance table).xlsx"
#fasta_file_location <- "C:/Users/ridwan.adesola/Desktop/summer sequence_TANZANIA/Resfinder Call_New"
#final_destination <- "C:/Users/ridwan.adesola/Desktop/ALIGNMENT RESFINDER/all_sequences.fasta"
# NO MORE TOUCHING

# Read csv and get list of nodes to search for
csv_file = read_xlsx(combined_csv_file, col_types = "text")
nodes_to_search <- csv_file["Contig"]
print(nodes_to_search)

# Get all fasta files to search
all_fasta_files <- list.files(fasta_file_location, all.files=FALSE,
                              full.names=TRUE)

# Search fasta files for the nodes
all_sequences <- c()
first_run = TRUE
for(fasta_file in all_fasta_files) {
  cat("Working on:", fasta_file)
  
  sequences <- read.fasta(fasta_file)
  for(remaining_nodes_to_search in nodes_to_search) {
    for(search_node in remaining_nodes_to_search) {
      
      result <- sequences[as.character(search_node)]
      
      if (!list(NULL) %in% result) {
        print("found sequence")
        print(result)
        
        all_sequences <- c(all_sequences, result)
        nodes_to_search <- nodes_to_search[nodes_to_search != search_node]
      }
    }
  }
  if(first_run) {
    open_value = "w"
    first_run = FALSE
  }
  else {open_value = "a"}
  write.fasta(all_sequences, names=names(all_sequences), open = open_value, file.out=final_destination)
  
  
}

print("DONE!")


