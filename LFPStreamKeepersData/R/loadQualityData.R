
loadQualityData <- function( ){
    file.name<-system.file( "extdata/rawQualityData.csv", package="LFPStreamKeepersData")
	df <- read.table( file.name,header=FALSE,sep=",",fill=TRUE)
}
