library( LFPStreamKeepersData )

library(XLConnect)
options(width=140)
Lyon_at_fiene_scoring_2006 <- function(){
    file.name<-system.file("extdata/BIBI/2006/Lyon_at_fiene_scoring_2006.xls",package="LFPStreamKeepersData")
    theData <- readWorksheet(loadWorkbook(file.name),sheet=1,startRow=2, startCol=1)
    theData$Lyon.Creek.at.Fiene[44]
    rep1<-theData[1:12,]
    rep2<-theData[14:25,]
    rep3<-theData[27:38,]
    composite<-theData[40:50,]
    colNames <- unlist(rep1[2,])
    names(rep1) <- colNames
    names(rep2) <- colNames
    names(rep3) <- colNames
    names(composite) <- colNames
    sum(as.numeric(rep1[3:12,"Score"]))
    sum(as.numeric(rep2[3:12,"Score"]))
    sum(as.numeric(rep3[3:12,"Score"]))
    sum(as.numeric(composite[3:11,"Score"]))
    rownames(rep1)<-unlist(rep1[,"Metric"])
    rownames(rep2)<-unlist(rep2[,"Metric"])
    rownames(rep3)<-unlist(rep3[,"Metric"])
    rownames(composite)<-unlist(composite[,"Metric"])
    rep1 <- rep1[,colSums(is.na(rep1))<nrow(rep1)]
    rep1 <- subset(rep1, select=-c(Metric))

    retval <- list(rep1=rep1,rep2=rep2,rep3=rep3,composite=composite)
    return( retval )
}

Lyon_at_fiene_scoring_2007 <- function(){
	# this one does not split into reps, but want to specify a factor to differentiate reps.
    file.name<-system.file("extdata/BIBI/2007/Lyon_Creek_Fiene_Scoring_2007.xls",package="LFPStreamKeepersData")
    theData <- readWorksheet(loadWorkbook(file.name),sheet=1,startRow=2, startCol=1)
	
    theData <- theData[,colSums(is.na(theData))<nrow(theData)] # Drop Columns that are all NA
	theData <- theData[-which(apply(theData,1,function(x)all(is.na(x)))),] # Drop Rows that are all NA
    colNames <- unlist(theData[2,])
    names(theData) <- colNames
	# Still want to drop the rows with Metric in them
	# And want to put in the ffactor to identify the Rep.

    return( theData )
}
