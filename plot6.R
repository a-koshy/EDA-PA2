# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California 
# (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

# Read in data
codes<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

# Subset data for the two regions
balt<-subset(pm25, fips=="24510")
la<-subset(pm25, fips=="06037")

# Includes motorcycles as well as 'Motor Vehicles'
motor_balt<-subset(balt, balt$SCC %in% codes$SCC[grep("Motor", codes$Short.Name)])
motor_la<-subset(la, la$SCC %in% codes$SCC[grep("Motor", codes$Short.Name)])

total_balt<-as.data.frame(tapply(motor_balt$Emissions, motor_balt$year, sum))
total_la<-as.data.frame(tapply(motor_la$Emissions, motor_la$year, sum))

# Plot it
png(filename="plot6.png")
ggplot()+
  geom_line(aes(x=unique(motor_balt$year), y=total_balt, color="blue"))+
  labs(title="Emissions from motor vehicle sources", subtitle="1999-2008",x="Year", y="Total emissions (tons)")+
  geom_line(aes(x=unique(motor_balt$year), y=total_la, color="red"))+
  scale_colour_manual(name="Region",
                      values=c("red", "blue"),
                      labels=c("Baltimore City","Los Angeles County"))
dev.off()