library(ggplot2)
# library(RSvgDevice)
library(reshape2)
library(dplyr)
library(vegan)

env <- read.table(file="../bioblitz.env.txt", header=TRUE)
otu <- read.table(file="../r1000_just_bac/bioblitz_r1000.03.shared", header=T)
alpha3 <- read.table(file="../r1000_just_bac/alpha.bac.03.txt", header=T)
alpha5 <- read.table(file="../r1000_just_bac/alpha.bac.05.txt", header=T)
phyla <- read.table(file="../bioblitz.all.taxa.txt", header=T)

wetcolor <- c("natural" = "#6699FF" , "restored" = "#D2B48C", "constructed" = "#FF8247")

#remove otus not in these samples
freq<-specnumber(otu, MARGIN=2)
otu<-otu[,freq>0]

#pull out just samples that have seqs
env.little <- semi_join(env, alpha3)
env.little$type <- droplevels(env.little$type)

boxplot(alpha3$sobs~env.little$wetland, main="Species observed by wetland type", ylab="Species observed (97% similar)")
boxplot(alpha5$sobs~env.little$wetland, main="Genera observed by wetland type", ylab="Genera observed (95% similar)")

boxplot(alpha3$sobs~env.little$type, main="Species observed by sample type", ylab="Species observed (97% similar)")
boxplot(alpha5$sobs~env.little$type, main="Genera observed by sample type", ylab="Genera observed (95% similar)")

boxplot(alpha3$invsimpson~env.little$wetland, main="Diversity by wetland type", ylab="Inverse Simpson (97% similar)")
boxplot(alpha5$invsimpson~env.little$wetland, main="Diversity by wetland type", ylab="Inverse Simpson (95% similar)")

boxplot(alpha3$invsimpson~env.little$type, main="Diversity by sample type", ylab="Inverse Simpson (97% similar)")
boxplot(alpha5$invsimpson~env.little$type, main="Diversity by sample type", ylab="Inverse Simpson (95% similar)")
