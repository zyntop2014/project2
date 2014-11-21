#This is the R programming for plot 1

## Getting full dataset
NEI<-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")


## Plotting the sum of emissions with year
 
  
Emissions<-tapply(NEI$Emissions, NEI$year, sum)
xnames<-names(Emissions)
  
plot(Emissions,xaxt="n",type="b", xlab="Year", ylab="Emissions",col="red",
     main="Total emissions with year"))
axis(1, at=1:length(xnames), labels=xnames)




## saving to the file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


