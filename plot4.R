## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalCodes <- SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE)]

NEI.coal <- subset(NEI, SCC %in% coalCodes)
DT <- data.table(Emissions=NEI.coal$Emissions, year=NEI.coal$year)
NEI.totals <- DT[,list(totalEmissions=sum(Emissions)), by='year']

png(file="plot4.png", width=480, height=480, units="px") # Open png device
qplot(year, totalEmissions, data=NEI.totals, geom="line", main="Change in coal emissions in the US, 99-08")
dev.off() # Close Device
