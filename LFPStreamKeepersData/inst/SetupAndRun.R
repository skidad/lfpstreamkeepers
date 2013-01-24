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
qd <- loadQualityData()

##################
library(ggplot2)
df1 <- data.frame(sex       = factor(c("Female","Female","Male","Male")),
                 time       = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
                 total_bill = c(13.53, 16.81, 16.24, 17.42))
			
ggplot(data=df1, aes(x=time, y=total_bill, fill=sex)) + geom_bar(stat="identity")

# Bar graph, time on x-axis, color fill grouped by sex -- use position_dodge()
ggplot(data=df1, aes(x=time, y=total_bill, fill=sex)) + geom_bar(stat="identity", position=position_dodge())
ggplot(data=df1, aes(x=time, y=total_bill, fill=sex)) + geom_bar(stat="identity", position=position_dodge(), colour="black")

# Change colors
ggplot(data=df1, aes(x=time, y=total_bill, fill=sex)) + geom_bar(stat="identity", position=position_dodge(), colour="black") +
    scale_fill_manual(values=c("#999999", "#E69F00"))
		
		
#########################################
hh <- t(VADeaths)[, 5:1]
mybarcol <- "gray20"
mp <- barplot(hh, beside = TRUE,
        col = c("lightblue", "mistyrose",
                "lightcyan", "lavender"),
        legend = colnames(VADeaths), ylim = c(0,100),
        main = "Death Rates in Virginia", font.main = 4,
        sub = "Faked upper 2*sigma error bars", col.sub = mybarcol,
        cex.names = 1.5)
segments(mp, hh, mp, hh + 2*sqrt(1000*hh/100), col = mybarcol, lwd = 1.5)
stopifnot(dim(mp) == dim(hh))  # corresponding matrices
mtext(side = 1, at = colMeans(mp), line = -2,
      text = paste("Mean", formatC(colMeans(hh))), col = "red")