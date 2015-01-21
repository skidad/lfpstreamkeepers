
readScoringXls <- function( fileName ){
    library(XLConnect)
    ## this one does not split into reps, but want to specify a factor to differentiate reps.
    file.name<-system.file( fileName, package="LFPStreamKeepersData")
    theData <- readWorksheet(loadWorkbook(file.name),sheet=1,startRow=2, startCol=1)

    theData <- theData[,colSums(is.na(theData))<nrow(theData)] # Drop Columns that are all NA
    theData <- theData[-which(apply(theData,1,function(x)all(is.na(x)))),] # Drop Rows that are all NA
    colNames <- unlist(theData[2,])
    names(theData) <- colNames
    theData <- subset( theData, Metric!="Metric" ) # Drop the rows with Metric in them
    theData <- theData[,-c(4)] # really want to drop un-named colums

    ## Put in the factor to identify the Rep.
    theData$Replicate <- as.factor(rep(NA,nrow(theData)))
    levels(theData$Replicate) <- c("Rep1", "Rep2", "Rep3", "Composite")
    repStarts <- grep("Rep|Composite",theData$Total)

    theData$Replicate[repStarts[1]:repStarts[2]-1] <- rep("Rep1",(repStarts[2]-repStarts[1]))
    theData$Replicate[repStarts[2]:repStarts[3]-1] <- rep("Rep2",(repStarts[3]-repStarts[2]+1))
    theData$Replicate[repStarts[3]:repStarts[4]-1] <- rep("Rep3",(repStarts[4]-repStarts[3]+1))
    theData$Replicate[repStarts[4]:nrow(theData)] <- rep("Composite",(nrow(theData)-repStarts[4]+1))

    ## Clean up total column.
    theData$Total[(repStarts[4]+2):nrow(theData)] <- rep(NA,nrow(theData)-(repStarts[4]+2)+1)

    ## Drop the Scoring Biometrics Rows
    theData <- subset( theData, Metric!="Scoring Biometrics" ) # Drop the rows with Metric in them

    ## Renumber the names column
    rownames(theData) <- c(1:nrow(theData))


    return( theData )
}
