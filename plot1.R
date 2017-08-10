# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Read in data
codes<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

# Extract and plot total emissions by year
src<-tapply(pm25$Emissions, pm25$year, sum)

png(filename = "plot1.png")
plot(x=unique(pm25$year), y=src, main="Total PM2.5 emissions decreased from 1999 to 2008",
     xaxt="n",
     xlab="Year", ylab="Total emissions (tons)", type="b",
     pch=19)
axis(1, at=c("1999", "2002", "2005", "2008"), labels=c("1999", "2002", "2005", "2008"))

dev.off()