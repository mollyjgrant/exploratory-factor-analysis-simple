# script for exploratory factor analysis (EFA)
  # author: Molly Grant (Bergquist-O'Sullivan)
  # date: 2 May 2024 
  # R version 3.6.2 (2019-12-12)
  # running under: OS X Snow Leopard 13.6.5

########################
# set-up ###
########################
#### load packages ####
library(dplyr)
library(psych)
library(GPArotation)
library(ggplot2)


########################
# analysis ###
########################
# note: data set up done prior to this
######### factorability #########

  #KMO
KMO(data)

  #Bartlett test
cortest.bartlett(data[,2:6]) # note: can also run this on the correlation matrix

######### efa #########

fact <- data[,2:6] # columns 2-6
factnumber <- psych::fa.parallel(data[,2:6], fm = 'pa', fa = 'fa', n.obs = 6368)
print(factnumber)

Loadings <- fa(data[,2:6], nfactors = 2, rotate = 'oblimin', fm = 'pa') # direct oblimin chosen so factors can be correlated
print(Loadings$loadings,cutoff = 0.3)

  # visual representation 
fa.diagram(Loadings, digits =  3) 