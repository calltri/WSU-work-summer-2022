# Name: Madison Call
# Date: 6/27/2022
# Description: Create a venn diagram

#https://www.geeksforgeeks.org/how-to-create-a-venn-diagram-in-r/#:~:text=Venn%20diagram%20is%20also%20known%20as%20Logic%20diagram,major%20among%20them%20are%3A%20Union%2C%20Intersection%2C%20and%20Complement.
# Two main options: 
# Can separately calculate item and overlap areas
# Or can take lists for every gene and automatically calculate the overlap between them
# based on which value are equal (ie: 1,2 2,3 would create a diagram with 1 in 
# each element + overlap)
# Adding names is trivial in both cases

#https://www.rdocumentation.org/packages/dendextend/versions/1.15.2/topics/tanglegram
#https://r-phylo.org/wiki/HowTo/InputtingTrees

install.packages("ggVennDiagram")                                   

library("ggVennDiagram")             

l1 <- c(1,2,3)
l2 <- c(2,3,4)
name1 <- "First"
name2 <- "Second"

x <- list(name1=l1, name2=l2)
ggVennDiagram(x, label_alpha = FALSE, label_color = "White")

install.packages("dendextend")
library(dendextend)
