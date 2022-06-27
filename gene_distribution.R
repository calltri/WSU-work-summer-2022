# Name: Madison Call
# Date: 6/24/2022
# Description: Looks at a csv file with the format 
# ID, Species, G1, G2, G3 where G* is a 1 or 0
# and creates contingency tables G* with the form
#   Species:
# y 1  2  3  
# n
library(dplyr)


data <- read.csv("C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/gene_distribution/gene_distribution.csv")
destination_file <- "C:/Users/madis/Documents/rstuff/WSU-work-summer-2022/excel_testing/gene_distribution/tables.csv"

# Get all gene names
gene_names <- c()
for (name in names(data)) {
  if (substr(name, 1, 1) == "G") {
    gene_names = c(gene_names, name)
  }
}

species_names <- unique(data$Species)

all_results <- list()
first_run = TRUE
for (gene in gene_names) {}
gene <- gene_names[1]

gene_pos_results <- c()
gene_neg_results <- c()

for (species_name in species_names) {
  group <- filter(data, .data[[col]] == species_name, .data[[gene]] == 1)
  size_group <- length(unlist(group[gene]))
  gene_pos_results <- c(gene_pos_results, size_group)
  group <- filter(data, .data[[col]] == species_name, .data[[gene]] == 0)
  size_group <- length(unlist(group[gene]))
  gene_neg_results <- c(gene_neg_results, size_group)
  
}
gene_table <- t(data.frame(
  "Y" = gene_pos_results,
  "N" = gene_neg_results
))
colnames(gene_table) <- species_names
write.table(paste("Table for gene: ", gene), destination_file, append = !first_run)
write.table(gene_table, destination_file, sep=",", append = TRUE, col.names = NA)
if (first_run) {first_run = FALSE}
