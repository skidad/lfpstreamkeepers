
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
	# And want to put in the factor to identify the Rep.
	# wand to drop un-named colums,
	# want to clean up total column.

    return( theData )
}