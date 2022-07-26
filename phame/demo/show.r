
BiocManager::install("DECIPHER")

library(ape)
library(dendextend)
library(DECIPHER)


#myTree <- read.tree(file = "./demo/phame_examples/ecoli/workdir/results/trees/ecoli_all.fasttree")
#plot(myTree)

# this lets us read in Newick file formats into dendrograms
a <- ReadDendrogram("./demo/phame_examples/ecoli/workdir/results/trees/ecoli_all.fasttree")
a <- set(a, "labels_col", "blue") 
plot(a)

