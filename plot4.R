# Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999–2008?

library(ggplot2)

# Read in data
codes<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

# Subset coal sources
coal<-subset(pm25, pm25$SCC %in% codes$SCC[grep("*[Cc]oal", codes$EI.Sector)])

total<-as.data.frame(tapply(coal$Emissions, coal$year, sum))

# Plot it
png(filename = "plot4.png")

ggplot()+geom_line(aes(x=unique(coal$year), y=total))+labs(title="Emissions from coal combustion-related sources", subtitle="1999-2008",x="Year", y="Total emissions (tons)")

dev.off()