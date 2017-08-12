# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Read in data
codes<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

# Extract and plot total emissions by year in Baltimore City
balt<-subset(pm25, fips==24510)

src_balt<-tapply(balt$Emissions, balt$year, sum)

png(filename="plot2.png")
plot(x=unique(balt$year), y=src_balt, main="Total PM2.5 emissions in Baltimore City, 1999-2008", 
     xaxt="n",
     xlab="Year", ylab="Total emissions (tons)", type="b",
     pch=19, ylim=c(0,3400))
axis(1, at=c("1999", "2002", "2005", "2008"), labels=c("1999", "2002", "2005", "2008"))

dev.off()