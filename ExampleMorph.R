
#Load required packages
library(raster)
library(animation)
#Load raster morphing function
setwd("~/Dropbox/My Research/MyFunctions/RasterMorph")
source('RasterMorphFunc.R')


#Load in rasters
new.e <- raster('Data/MR7_Lidar.tif')
old.e <- raster('Data/MR7_Old.tif')

new.e.40 <- aggregate(new.e,fact=2)
old.e.40 <- aggregate(old.e,fact=2)



setwd("~/Dropbox/My Research/MyFunctions/RasterMorph/Gifs")
RasterMorph(old.e.40,new.e.40,grid=40,iter=20,vert=4,.3,-10,25,border=NA,height=800,width=1000,eye=2)

