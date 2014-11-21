#This is the R programming for plot 4

library(ggplot2)


## Getting full dataset
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")






# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

## Plotting the sum of emissions with year

qplot(year, Emissions, stat="summary", fun.y="sum", data=combustionNEI,  geom=c("point","line"),
      main="Total emissions with year for coal combustion-related processes"))


## saving to the file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

