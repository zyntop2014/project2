#This is the R programming for plot 2

## Getting full dataset
NEI<-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_ClassificationCode.rds")


## Plotting the sum of emissions with year

NEI<-NEI[which(NEI$fips=="24510"),]

Emissions<-tapply(NEI$Emissions, NEI$year, sum)
xnames<-names(Emissions)

plot(Emissions,xaxt="n",type="b", xlab="Year", ylab="Emissions",col="red", 
     main="Total emissions with year in Baltimore City")
axis(1, at=1:length(xnames), labels=xnames)




## saving to the file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


