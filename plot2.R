## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
## (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
## plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)
DT <- data.table(Emissions=NEI$Emissions, fips=NEI$fips, year=NEI$year)
NEI.baltimore <- DT[DT$fips=="24510",]
NEI.baltimore.totals <- NEI.baltimore[,list(totalEmissions=sum(Emissions)), by='year']

png(file="plot2.png", width=480, height=480, units="px") # Open png device
plot(NEI.baltimore.totals, type="l", main="PM2.5 emissions in Baltimore from 1999 to 2008")
dev.off() # Close Device
