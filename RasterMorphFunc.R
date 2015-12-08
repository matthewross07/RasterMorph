
#Raster morphing function works with objects of class "raster" from the "raster"
#Package. #The function requires 3 things from the user: 
#old raster, 
#new raster,
#and grid size.
# The function can change the following optional features
#Number of slides (iter) = 20
# Vertical exageration in plot (vert) = 2
#Interval time per slide (int) = .3 seconds
# Horizontal rotation of plot (theta) = 20
# Vertical rotation of plot (phi) = 35


RasterMorph <- function(old.e,new.e,grid,iter,vert,int,theta,phi,border,width,height,eye){
  #Set default avlues for # of iterations, vertical exageration, and time 
  #per slide. Time per slide x # of iterations will be total time for gif
  # to 20 and 0. User can change if output is poor.
  if(missing(iter)){
    iter <- 20
  }
  if(missing(vert)){
    vert <- 2
  }
  if(missing(int)){
    int <- .3
  }
  if(missing(theta)){
    theta <- 20
  }
  if(missing(phi)){
    int <- 35
  }
  if(missing(border)){
    border <- NA
  }
  if(missing(width)){
    width <- 800
  }
  if(missing(height)){
    height <- 800
  }
  if(missing(eye)){
    eye <- sqrt(3)
  }
  
  labels <- rep('',iter)
  labels[c(1,2,iter-1,iter)] <- c('Pre-Mining','Pre-Mining','Post-Mining','Post-Mining')
  #Setup old elevation profile as a matrix
  old.m <- as.matrix(old.e)
  old.m[is.na(old.m)] <- min(old.m,na.rm=T)

  
  #Setup new elevation profile as matrix
  new.m <- as.matrix(new.e)
  new.m[is.na(new.m)] <- min(new.m,na.rm=T)
  
  #Setup x and y dimensions
  x <- grid*1:nrow(new.m)
  y <- grid*1:ncol(new.m)
  
  #Make an array with 20 
  l <- iter
  m1 <- Map(seq,as.vector(old.m),as.vector(new.m),length.out=l)
  m2 <- t(array(unlist(m1),dim=c(l,length(new.m))))
  
  par(mar=c(0,0,0,0))



  ani.options(ani.width=width,ani.height=height)
  saveGIF({
    for(i in 1:l){
    m3 <- vert*matrix(m2[,i],nrow=nrow(new.m),ncol=ncol(new.m))
    persp(x,y,m3,scale=F,r=eye,box=F,shade=T,main=labels[i],
          theta=theta,phi=phi,border=border,cex=2)}},
    interval=.3,movie.name='ani.gif'
  )
}

