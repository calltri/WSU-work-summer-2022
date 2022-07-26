
library(ape)

help(read.tree)

myTree <- read.tree(file = "./demo/phame_examples/ecoli/workdir/results/trees/ecoli_all.fasttree")
plot(myTree)
