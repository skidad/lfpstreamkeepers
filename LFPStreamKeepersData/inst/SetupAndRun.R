library( LFPStreamKeepersData )
source("R/plotBIBI.R")
source("inst/loadBIBI.R")
plotBIBI( system.file("extdata", "BIBI", 'bibiSummaryData.csv', package="LFPStreamKeepersData"),createJpg=FALSE )
bibiScoringData
Site.barplot(CollectionSite = "mcAleerAcres")
Site.barplot(CollectionSite = "mcAleerPerkins")
Site.barplot(CollectionSite = "lyon178th")
Site.barplot(CollectionSite = "lyon35th")

library(RODBC)
file.name <- "LFPStreamKeepersData/extdata/BIBI/2006/Lyon_at_Fiene_Scoring_2006.xls"

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
qd <- loadQualityData()
head(qd)
winter2013 <- subset(qd, Date == "1/19/2013" )
write.table(winter2013)
	
print(xtable(winter2013), type="html")

x <- as.matrix(format(winter2013))
rownames(x) <- rep("", nrow(x))
print(x, quote=FALSE, right=TRUE)


