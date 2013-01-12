
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