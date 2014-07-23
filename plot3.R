## Of the four types of sources indicated by the type (point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999–2008 for Baltimore City? Which have seen increases in 
## emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
## answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)
library(ggplot2)
DT <- data.table(NEI)
NEI.baltimore <- DT[fips == "24510"]
NEI.baltimore.totals <- NEI.baltimore[,list(totalEmissions=sum(Emissions), type), by=c('year','type')]
qplot(year, totalEmissions, data=NEI.baltimore.totals, colour=type, geom="line")