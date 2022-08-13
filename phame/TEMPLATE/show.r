####################################################################
# Run these once to install any packages
chooseCRANmirror()
install.packages("BiocManager")
BiocManager::install("DECIPHER")
BiocManager::install("dendextend") # plotting phylo/tanglegrams     
                                                                   #
####################################################################

# Imports
library(ape)
library(dendextend)
library(DECIPHER)


# ReadDendrogram() lets us read in Newick tree file formats into
# dendrograms where we can then use the plethora of customizations
# in the dendextend package to make the tree plot the way we want

a <- ReadDendrogram("./workdir/results/trees/ecoli_all.fasttree")
a <- set(a, "labels_col", "blue") # for example, set the labels to blue
# for more customizations see: https://cran.r-project.org/web/packages/dendextend/vignettes/dendextend.html 
plot(a)

