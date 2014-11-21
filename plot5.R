#This is the R programming for plot 5

library(ggplot2)


## Getting full dataset
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

NEI<-NEI[which(NEI$fips=="24510"),]

# Subset vehicle related NEI data
VEHRelated <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

VEHSCC <- SCC[VEHRelated,]$SCC
VEHNEI <- NEI[NEI$SCC %in% VEHSCC,]

## Plotting the sum of emissions with year

qplot(year, Emissions, stat="summary", fun.y="sum", data=VEHNEI,  geom=c("point","line"), 
      main="Total emissions with year for motor vehicles in Baltimore City")


## saving to the file
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()