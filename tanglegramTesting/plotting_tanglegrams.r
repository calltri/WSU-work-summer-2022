# https://cran.r-project.org/web/packages/dendextend/vignettes/dendextend.html

### First time setup ###
chooseCRANmirror()
install.packages("BiocManager")
BiocManager::install("dendextend") # plotting phylo/tanglegrams
install.packages("viridis") # for adding color ramps 

### Testing ###
library(dendextend)

d1 <- as.dendrogram(hclust(dist(1:100)))
d2 <- as.dendrogram(hclust(dist(1:100)))


# configure visuals with the set() func
d1 <- set(d1, "labels_col", "blue") # set returns a new dendrogram with the applied change
#d1 <- set(d1, "labels", c("test1", "test2"))
d1 <- set(d1, "labels_cex", 1)
# labels(d1) # read labels
plot(d1)


# Testing with viridis package to add color scales to diagrams
library(viridis)
d1 <- highlight_branches_col(d1, rev(magma(100)))
plot(d1)


dl <- dendlist(d1, d2) # to make a plotable tangel gram pass two phylo trees to dendlist and plot the resulting obj
tanglegram(dl, sort = TRUE, common_subtrees_color_lines = FALSE, highlight_distinct_edges  = FALSE, highlight_branches_lwd = FALSE) # plot tanglegram


#plot(dl, main="this is a test") # this will actually plot the tanglegram however you probably want to use the tanglegram func instead because it gives you controls over how it's plotted.

