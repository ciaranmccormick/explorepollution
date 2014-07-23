## Have total emissions from PM2.5 decreased in the United States from 1999 to 
## 2008? Using the base plotting system, make a plot showing the total PM2.5 
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read in datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)
DT <- data.table(Emissions=NEI$Emissions, year=NEI$year)
NEI.totals <- DT[,list(totalEmissions=sum(Emissions)), by='year']
plot(NEI.totals)
