## How have emissions from motor vehicle sources changed from 1999–2008 in 
## Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorCodes <- SCC$SCC[grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)]

NEI.vehicle <- subset(NEI, SCC %in% motorCodes)

DT <- data.table(NEI.vehicle)
NEI.baltimore <- DT[fips == "24510"]
NEI.totals <- NEI.baltimore[,list(totalEmissions=sum(Emissions)), by='year']

png(file="plot5.png", width=480, height=480, units="px") # Open png device
qplot(year, totalEmissions, data=NEI.totals, geom="line")
dev.off() # Close Device
