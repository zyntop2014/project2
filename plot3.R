#This is the R programming for plot 3

library(ggplot2)


## Getting full dataset
NEI<-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")


## Plotting the sum of emissions with year

NEI<-NEI[which(NEI$fips=="24510"),]


qplot(year, Emissions, stat="summary", fun.y="sum", data=NEI, facets=. ~type, geom=c("point","line"),
      main="Total emissions with year for four types in Baltimore City"))


## saving to the file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()