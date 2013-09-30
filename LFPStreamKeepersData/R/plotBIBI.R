
plotBIBI <- function( bibiDataCsv, createJpg = FALSE ) {
	df <- read.table( bibiDataCsv,header=TRUE,sep=",")
	plotColors<- c("red","yellow","black","blue")
	lineWidth<- 3
	# Start device driver to save output to figure.png
	if ( createJpg ) {
		plotFile<- file.path( getwd(), "BibiSummaryData.jpg" )
		cat( "Writing plot to", plotFile, "\n" )
		jpeg(filename="BibiSummaryData.jpg", width=600, bg="white")
	}

	plot(df$Lyon.at.35th~df$Year,
		las=1, #upright y axis labels.
		type="o",
		col=plotColors[1],
		pch=21,
		lty=1,lwd=lineWidth,
		ylab = "BIBI Score",
		ylim = c(8,48),
		xlab = "Sampling Year")

	text( 2005, 47, "Excellent (46 -50)",pos=4,cex=0.8)
	abline(h=46,col="black",lty=4)
	text( 2005, 39, "Good (38 - 44)",pos=4,cex=0.8)
	abline(h=38,col="black",lty=4)
	text( 2005, 29, "Fair (28 - 36)",pos=4,cex=0.8)
	abline(h=28,col="black",lty=4)
	text( 2005, 19, "Poor (18 - 26)",pos=4,cex=0.8)
	abline(h=18,col="black",lty=4)
	text( 2005, 11, "Very Poor (10 - 16)",pos=4,cex=0.8)
	abline(h=10,col="black",lty=4)

	lines(df$Lyon.near.178th~df$Year, type="o", pch=22, lty=1, lwd=lineWidth, col=plotColors[2])
	lines(df$McAleer.at.Perkins ~df$Year, type="o", pch=23, lty=1, lwd=lineWidth, col=plotColors[3])
	lines(df$McAleer.at.Animal.Acres~df$Year, type="o", pch=24, lty=1,lwd=lineWidth,  col=plotColors[4])

	title(main = "BIBI 2005-2012")

	#legendNames <- lapply( names(df)[2:5], gsub, '\\\\.', ' ')
	legendNames <- lapply(names(df)[2:5], function(x){gsub('\\.',' ',x)})
	legend(2009, 47, legendNames, cex=0.8, col=plotColors, pch=21:24, lty=c(1,1,1,1),
		lwd=c(lineWidth,lineWidth,lineWidth,lineWidth))

	if ( createJpg ) dev.off()
}


Site.barplot <- function(CollectionSite = "mcAleerAcres")
{
    Val1 <- eval(parse(text=paste("as.numeric(bibiScoringData$y2006$",
                       CollectionSite,"[bibiScoringData$y2012$",
                       CollectionSite,"$Replicate=='Composite',3])")))
    Val2 <- eval(parse(text=paste("as.numeric(bibiScoringData$y2007$",
                       CollectionSite,"[bibiScoringData$y2012$",
                       CollectionSite,"$Replicate=='Composite',3])")))
    Val3 <- eval(parse(text=paste("as.numeric(bibiScoringData$y2008$",CollectionSite,"[bibiScoringData$y2012$",CollectionSite,"$Replicate=='Composite',3])")))
    Val4 <- eval(parse(text=paste("as.numeric(bibiScoringData$y2009$",CollectionSite,"[bibiScoringData$y2012$",CollectionSite,"$Replicate=='Composite',3])")))
    Val5 <- eval(parse(text=paste("as.numeric(bibiScoringData$y2010$",CollectionSite,"[bibiScoringData$y2012$",CollectionSite,"$Replicate=='Composite',3])")))
    Val6 <- eval(parse(text=paste("as.numeric(bibiScoringData$y2012$",CollectionSite,"[bibiScoringData$y2012$",CollectionSite,"$Replicate=='Composite',3])")))

    height <- cbind(Year2006 = Val1, Year2007 = Val2, Year2008 = Val3, Year2009 = Val4, Year2010 = Val5, Year2012 = Val6)


                                        # Add extra space to right of plot area; change clipping to figure
    par(mar=c(5.1, 4.1, 4.1, 8.7), xpd=TRUE)

    barplot(height, col = c("darkgreen","blue","red","yellow","orange","pink","brown","tan","lightblue","white"),beside = FALSE)

    # position labels just above bottom of each section of barplot
    yVal <- cumsum(height[,"Year2006"]) - height[,"Year2006"] + 0.6
    barLabels <- c("Total Num","Ephem","Plecop","Trichop","Long-lived","Intolerant","Tolerant%","Preditors%","Clinger","Dominance 3 Taxa %")
    barLabelsArray <- cbind(yVal,barLabels)

    z<-apply(barLabelsArray, 1, function(y) { text( 0, y=as.numeric(y[1]), y[2] , pos=4, offset=1.0, cex=0.7, font=2) })

    title(paste("Composite BIBI Score for", CollectionSite, "by Year"), col="blue")

    legend( "topright",
           inset=c(-0.4,0),
           cex=0.7,
           legend = c("10 to 16 Very Poor", "18 to 26 Poor",
                   "28 to 36 Fair", "38 to 44 Good",
                   "46 to 50 Excellent" ),
           title="Total Score")

}

