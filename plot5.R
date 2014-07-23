## How have emissions from motor vehicle sources changed from 1999–2008 in 
## Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorCodes <- SCC$SCC[grep("vehicle", SCC$EI.Sector, ignore.case=TRUE)]

NEI.vehicle <- subset(NEI, SCC %in% motorCodes)

DT <- data.table(Emissions=NEI.vehicle$Emissions, year=NEI.vehicle$year)
NEI.baltimore <- DT[fips == "24510"]
NEI.totals <- NEI.baltimore[,list(totalEmissions=sum(Emissions)), by='year']
qplot(year, totalEmissions, data=NEI.totals)
