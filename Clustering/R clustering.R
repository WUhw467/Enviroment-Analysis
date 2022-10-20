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

##################  k - means----------------

k <- 3 # number of clusters
(kmeansResult1 <- kmeans(Record_9D_Pretend1, k)) ## uses Euclidean
kmeansResult1$centers

kmeans_basic_df <- data.frame(Cluster = kmeansResult1$cluster, Record_9D_Pretend)

################ Cluster vis-------------------
(fviz_cluster(kmeansResult1, data = Record_9D_Pretend1,
              ellipse.type = "convex",
              #ellipse.type = "concave",
              palette = "jco",
              #axes = c(1, 4), # num axes = num docs (num rows)
              ggtheme = theme_minimal()))

ggplot(data = kmeans_basic_df, aes(y = Cluster)) +
  geom_bar(aes(fill = Land)) +
  ggtitle("Count of Clusters by Land") +
  theme(plot.title = element_text(hjust = 0.5))

##################  k - means----------------

k <- 6 # number of clusters
(kmeansResult2 <- kmeans(Record_9D_Pretend1, k)) ## uses Euclidean
kmeansResult2$centers

kmeans_basic_df <- data.frame(Cluster = kmeansResult2$cluster, Record_9D_Pretend)

################ Cluster vis-------------------
(fviz_cluster(kmeansResult2, data = Record_9D_Pretend1,
              ellipse.type = "convex",
              #ellipse.type = "concave",
              palette = "jco",
              #axes = c(1, 4), # num axes = num docs (num rows)
              ggtheme = theme_minimal()))

ggplot(data = kmeans_basic_df, aes(y = Cluster)) +
  geom_bar(aes(fill = Land)) +
  ggtitle("Count of Clusters by Land") +
  theme(plot.title = element_text(hjust = 0.5))

##################  k - means----------------

k <- 9 # number of clusters
(kmeansResult3 <- kmeans(Record_9D_Pretend1, k)) ## uses Euclidean
kmeansResult3$centers

kmeans_basic_df <- data.frame(Cluster = kmeansResult3$cluster, Record_9D_Pretend)

################ Cluster vis-------------------
(fviz_cluster(kmeansResult3, data = Record_9D_Pretend1,
              ellipse.type = "convex",
              #ellipse.type = "concave",
              palette = "jco",
              #axes = c(1, 4), # num axes = num docs (num rows)
              ggtheme = theme_minimal()))

ggplot(data = kmeans_basic_df, aes(y = Cluster)) +
  geom_bar(aes(fill = Land)) +
  ggtitle("Count of Clusters by Land") +
  theme(plot.title = element_text(hjust = 0.5))

############# hierarchical clustering
(M2_Eucl <- dist(Record_9D_Pretend1,method="minkowski", p=2))  ##same as Euclidean
Hist1 <- hclust(M2_Eucl, method="ward.D2")
plot(Hist1)

############# Euclidean
(Mcucl1 <- dist(Record_9D_Pretend1, method = "euclidean", diag = FALSE, upper = FALSE, p = 2))
png(file="HeatmapExampleEuclidean.png", width=1600, height=1600)
heatmap(as.matrix(Mcucl1), cexRow=2, cexCol = 2)
dev.off()

############# Manhattan
(M1_Man <- dist(Record_9D_Pretend1,method="manhattan"))
png(file="HeatmapExampleManhattan.png", width=1600, height=1600)
heatmap(as.matrix(M1_Man), cexRow=2, cexCol = 2)
dev.off()

############# Cosine Sim
(CosSim <- stylo::dist.cosine(as.matrix(Record_9D_Pretend1)))
png(file="HeatmapExampleCos.png", width=1600, height=1600)
heatmap(as.matrix(CosSim), cexRow=2, cexCol = 2)
dev.off()

## Silhouette........................
fviz_nbclust(Record_9D_Pretend1, method = "silhouette", 
             FUN = hcut, k.max = 10)


