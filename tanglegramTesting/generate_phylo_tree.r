# Guide used: https://fuzzyatelin.github.io/bioanth-stats/module-24/module-24.html
# This was an attempt at making phylogenetic trees using just R. This is as far as I was able to get in the guide before 
# moving to trying to use phame for phylogenetic tree generation. The reason for the move was because I could tell for sure it had
# the ability to use reference genomes which is what I couldn't find a work around in the R method below.

install.packages("adegenet")

library(adegenet) # Toolset for the exploration of genetic and genomic data.
library(ape) # functions for reading, writing, manipulating, analysing, and simulating phylogenetic trees, etc


dna <- fasta2DNAbin("10832wA1_Wat1A9.fasta")
dna

# Testing below is using the distance method of analysis to just try and get something working right now:

# The dist.dna func assumes we are passing it entire genomes, currently we are passing it a bunch of contigs from one strain which is not what we want at all.
# we need some way of using a reference genome and then compare contigs of different strains. 

di <- dist.dna(dna, model = "TN93") # the TN93 model allows for  different transition rates, heterogenous base frequencies, and variation of substitution rate at the same site
length(di)

# if the dna is really different you get INF values which breaks the paint func
#temp <- as.data.frame(as.matrix(di))
#table.paint(temp, clabel.row=0.5, clabel.col=0.5)


# Now render the phylogenetic tree using the calculated distances:
library(dendextend)

#d2 <-as.dendrogram(hclust(di))
d2 <- as.dendrogram(hclust(di, method = "average", members = NULL))# UPGMA is the average part here
plot(d2)

