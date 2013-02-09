library( LFPStreamKeepersData )
plotBIBI( system.file("extdata", "BIBI", 'bibiSummaryData.csv', package="LFPStreamKeepersData"),createJpg=FALSE )

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
Site.barplot()
##################
qd <- loadQualityData()
head(qd)
qd

