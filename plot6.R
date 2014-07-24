## Compare emissions from motor vehicle sources in Baltimore City with 
## emissions from motor vehicle sources in Los Angeles County, California 
## (fips == "06037"). Which city has seen greater changes over time in motor 
## vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorCodes <- SCC$SCC[grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)]
NEI.vehicle <- subset(NEI, SCC %in% motorCodes)

# Convert to data table
DT <- data.table(NEI.vehicle)
NEI.baltimore <- DT[fips %in% c("24510","06037")]

NEI.totals <- NEI.baltimore[,list(totalEmissions=sum(Emissions)), by=c('year',"fips")]

png(file="plot6.png", width=480, height=480, units="px") # Open png device
qplot(year,totalEmissions, colour=fips, data=NEI.totals.balt, geom="line")
dev.off() # Close Device
