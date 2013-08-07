gittop <- "c:/Users/Derek/Documents/lfpstreamkeepers.git"
setwd( gittop )
system("R CMD build LFPStreamKeepersData")
install.packages("XLConnect")
detach("package:LFPStreamKeepersData",unload=TRUE)
install.packages("LFPStreamKeepersData_0.2-0.tar.gz", type="source" )

library( LFPStreamKeepersData )

plotBIBI( system.file("extdata", "BIBI", 'bibiSummaryData.csv', package="LFPStreamKeepersData"),createJpg=FALSE )

source(system.file("loadBIBI.R", package="LFPStreamKeepersData"))
Site.barplot(CollectionSite = "mcAleerAcres")
Site.barplot(CollectionSite = "mcAleerPerkins")
Site.barplot(CollectionSite = "lyon178th")
Site.barplot(CollectionSite = "lyon35th")


######
# data accessor: load the raw data.
library( LFPStreamKeepersData )
source("LFPStreamKeepersData/R/plotBIBI.R")
source("LFPStreamKeepersData/inst/loadBIBI.R")

bibiScoringData
names(bibiScoringData)
names(bibiScoringData$y2012)
nil

################
## Connect to Excel File Pull and Format Data
# This one seems to drop data.
library(RODBC)
excel.connect <- odbcConnectExcel(system.file("extdata/BIBI/2006/Lyon_at_fiene_scoring_2006.xls",package="LFPStreamKeepersData"))
sheet.name <- "Sheet1"
dat <- sqlFetch(excel.connect, sheet.name, na.strings=c("","-"))
odbcClose(excel.connect)

#################

lyonFiene2006 <- readScoringXls( "extdata/BIBI/2006/Lyon_at_fiene_scoring_2006.xls")
lyonFiene2007 <- readScoringXls( "extdata/BIBI/2007/Lyon_Creek_Fiene_Scoring_2007.xls" )
##################
options(width=180)

##################
source("R/plotBIBI.R")
Site.barplot()
##################
library( LFPStreamKeepersData )
options(width=100)
qd <- lfpskLoadQualityData()
head(qd)
winter2013 <- subset(qd, Date == "1/19/2013" )
write.table(winter2013)

print(xtable(winter2013), type="html")


x <- as.matrix(format(winter2013))
rownames(x) <- rep("", nrow(x))
print(x, quote=FALSE, right=TRUE)

########
# format quality data for web.
# Used to produce tables found at:
# http://www.lfpstreamkeepers.org/data/quality-data-2013
library( LFPStreamKeepersData )
options(width=100)
qd <- lfpskLoadQualityData()
qualData <- as.matrix(format(subset(qd, Date == "7/20/2013" )))
rownames(qualData) <- rep("", nrow(qualData))
print(qualData, quote=FALSE, right=TRUE)
