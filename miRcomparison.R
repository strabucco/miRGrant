#compare 5 lists of mircoRNAs to see which are common among lists
#start by importing librarys and file to use
library(dplyr)
#process data to remove undesired characters
lists<-read.csv("miRSum.csv")
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("\\*","", x))
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("#", "", x))
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("-3p", "", x))
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("-5p", "", x))
#no3p<-gsub("-3p","", nostar)
#no5p<-gsub("-5p","", no3p)
#clean<-gsub("#","", no5p)
#str(lists)
#str(clean)
lists

#intersect each list together to find 2 list overlap

#intersect 2 list overlap to each other list to find 3 list overlap and repeat until all lists compared
