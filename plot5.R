# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Read in data
codes<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

# Subset for Baltimore City and motor vehicle sources

balt<-subset(pm25, fips==24510)

# Includes motorcycles as well as 'Motor Vehicles'
motor<-subset(balt, balt$SCC %in% codes$SCC[grep("Motor", codes$Short.Name)])

total<-as.data.frame(tapply(motor$Emissions, motor$year, sum))

# Plot it
png(filename="plot5.png")
ggplot()+geom_line(aes(x=unique(motor$year), y=total))+labs(title="Emissions from motor vehicle sources", subtitle="1999-2008",x="Year", y="Total emissions (tons)")
dev.off()