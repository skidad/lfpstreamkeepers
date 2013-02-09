
loadQualityData <- function( ){
    file.name<-system.file( "extdata/rawQualityData.csv", package="LFPStreamKeepersData")
	df <- read.table( file.name,header=T,sep=",",fill=TRUE)
	return( df )
}
