
readScoringXls <- function( fileName ){
	library(XLConnect)
	# this one does not split into reps, but want to specify a factor to differentiate reps.
    file.name<-system.file( fileName, package="LFPStreamKeepersData")
    theData <- readWorksheet(loadWorkbook(file.name),sheet=1,startRow=2, startCol=1)
	
    theData <- theData[,colSums(is.na(theData))<nrow(theData)] # Drop Columns that are all NA
	theData <- theData[-which(apply(theData,1,function(x)all(is.na(x)))),] # Drop Rows that are all NA
    colNames <- unlist(theData[2,])
    names(theData) <- colNames
	theData <- subset( theData, Metric!="Metric" ) # Drop the rows with Metric in them
	theData <- theData[,-c(4)] # really want to drop un-named colums
	theData$Replicate <- as.factor(rep(NA,nrow(theData)))
	levels(theData$Replicate) <- c("Rep1", "Rep2", "Rep3", "Composite")
	start <- pmatch("Rep. 3", theData$Total)
	finish <- start + 10
	theData$Replicate[start:finish] <- rep("Rep3",11)

	# And want to put in the factor to identify the Rep.
	# want to clean up total column.

    return( theData )
}