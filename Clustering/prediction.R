library(stats)  ## for dist
#https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/dist

## There are many clustering libraries
#install.packages("NbClust")
library(NbClust)
library(cluster)
library(mclust)

library(amap)  ## for Kmeans (notice the cap K)

library(factoextra) ## for cluster vis, silhouette, etc.
library(purrr)

#install.packages("stylo")
library(stylo)  ## for dist.cosine
#install.packages("philentropy")
library(philentropy)  ## for distance() which offers 46 metrics
## https://cran.r-project.org/web/packages/philentropy/vignettes/Distances.html
library(SnowballC)
library(caTools)
library(dplyr)
library(textstem)
library(stringr)
library(wordcloud)
library(tm) ## to read in corpus (text data)
library(rintakumpu/custom-kmeans)

## Always start small and easy.
## Let's start with the smallest and easiest dataset
## This is a record dataset with only 3 variables
## It is labeled data - so we will NEED TO REMOVE the label
## before clustering.

## I will set my working dir to point to the data on MY 
## computer :) You will need to update this.

setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/archive/R")
Record_9D_Pretend<-read.csv("NewLand.csv")
Record_9D_Pretend1 <- Record_9D_Pretend[-1]

str(Record_9D_Pretend1)

library(dplyr)
Record_9D_Pretend1 <- Record_9D_Pretend1 %>%
  mutate_all(as.numeric)

## change all to numeric (not int)
##Record_3D_Pretend$GRE <- as.numeric(Record_3D_Pretend$GRE)
str(Record_9D_Pretend1)
## 
a <- Record_9D_Pretend$Land
for (i in 1:51){a[i] = paste(a[i], toString(i), sep = ' ')}
rownames(Record_9D_Pretend1) = a

newvector1 <- c(2005, 26, 3.97, 0.03, 11, 15.2692, 0.1154, 42.3077, 0)
newvector2 <- c(2010, 26, 4.5, 0.1, 11, 17.3077, 0.3846, 42.3077, 22.3495)
newvector3 <- c(2017, 2467, 1151.7, 250, 480, 46.6842, 10.1338, 19.4568, 51.6852)

k <- 9 # number of clusters
(kmeansResult3 <- kmeans(Record_9D_Pretend1, k)) ## uses Euclidean
kmeansResult3$centers

kmeans_basic_df <- data.frame(Cluster = kmeansResult3$cluster, Record_9D_Pretend)

dist(rbind(newvector1, newvector2, newvector3, kmeansResult3$centers), method = 'euclidean')

