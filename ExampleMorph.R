
#Load required packages
library(raster)
library(animation)
#Load raster morphing function
source('RasterMorphFunc.R')


#Load in rasters
new.e <- raster('Data/MR7_Lidar.tif')
old.e <- raster('Data/MR7_Old.tif')

# If running slow aggregate 
new.e.40 <- aggregate(new.e,fact=2)
old.e.40 <- aggregate(old.e,fact=2)



setwd("Gifs")

#Function that makes the animation
RasterMorph(old.e.40,new.e.40,grid=40,iter=20,vert=4,.3,-10,25,border=NA,height=800,width=1000,eye=2)

