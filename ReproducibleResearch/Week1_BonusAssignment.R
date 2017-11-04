library(ggplot2)

## Extract the data for New York
setwd("C:/Users/Kelly/Desktop/DataScience/Reproducible Research")
Medical <- read.csv("payments.csv")
NewYork <- subset(Medical, Medical$Provider.State == "NY")

# Generate first plot
pdf(file = "Plot1.pdf")
ggplot(aes(Average.Total.Payments/1000, Average.Covered.Charges/1000), data = NewYork) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm") + 
  ggtitle("Medical Expenditures in New York State") + 
  xlab("Mean Total Payment (thousands of US Dollars)") + 
  ylab("Mean Covered Charges (thousands of US Dollars)")
dev.off()

# Get shorter labels for the conditions
Medical$DRG.Label <- rep(NA, 6401)
Medical$DRG.Definition <- as.character(Medical$DRG.Definition)
##cs <- unique(Medical$DRG.Definition)
##sts <- strsplit(as.character(cs), split = " ")
labels <- c("Pneumonia", "Heart Failure", "Esophagitis", "Nutrition", "Kidney", "Septicemia")
  cnd <- grep("194", Medical$DRG.Definition)
  Medical$DRG.Label[cnd] <- labels[1]   
  cnd <- grep("292", Medical$DRG.Definition)
  Medical$DRG.Label[cnd] <- labels[2] 
  cnd <- grep("392", Medical$DRG.Definition)
  Medical$DRG.Label[cnd] <- labels[3] 
  cnd <- grep("641", Medical$DRG.Definition)
  Medical$DRG.Label[cnd] <- labels[4] 
  cnd <- grep("690", Medical$DRG.Definition)
  Medical$DRG.Label[cnd] <- labels[5] 
  cnd <- grep("871", Medical$DRG.Definition)
  Medical$DRG.Label[cnd] <- labels[6] 
  
#Generate second plot
pdf(file = "plot2.pdf")
g <- ggplot(data = Medical, aes(Average.Total.Payments/1000, Average.Covered.Charges/1000))
g + geom_point(aes(col=DRG.Label), alpha = 0.25) +
  facet_wrap(DRG.Label~Provider.State) +
  xlab("Mean Total Payments (thousands of US Dollars)") +
  ylab("Mean Covered Charges (thousands of US Dollars)") + 
  theme(legend.position = "none")
dev.off()






