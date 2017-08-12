# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
library(reshape2)

# Read in data
codes<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

# Extract and plot emissions by type and year
balt<-subset(pm25, fips==24510)

b<-with(balt, tapply(Emissions, list(year, type), sum))
by_type <- melt(b, id=rownames(b), varnames = c("Year", "Type"), value.name = "Emissions")

png(filename="plot3.png")
ggplot(by_type, aes(x=Year, y=Emissions, colour=Type))+geom_line()+ggtitle("Total emissions in Baltimore, 1999-2008")+labs(y="Total emissions (tons)")
dev.off()