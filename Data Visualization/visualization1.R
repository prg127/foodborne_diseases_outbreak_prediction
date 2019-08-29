getwd()
#setting the window directory
setwd("c:\\Users\\Pranav\\Minor2")
getwd()
dataset <- read.csv("outbreaks.csv")


#visulization of dataset and its result
#for installation command is 
#install.packages("ggplot2")
library(ggplot2)
require('RColorBrewer')
#image1
#below graph show how many rows belongs to particular year
qplot(data=dataset, x=Year , xlab = 'Month' ,ylab = 'cases' , main = "Number of cases per Month")
#below graph show how many rows belongs to particular month 
#image2
qplot(data=dataset, x=Month , xlab = 'Month' ,ylab = 'cases' , main = "Number of cases per Month" , color = Month) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#below graph show how many rows belongs to particular state
#image3
qplot(data=dataset, x=State , xlab = 'state' ,ylab = 'cases', fill = State) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#below graph show relation between year,month,state and illnesses
#image4
qplot(data=dataset, x=Year, y=Illnesses , main = "Number of illnesses per year" , color = Year)
#image5
qplot(data=dataset, x=Month, y=Illnesses , main = "Number of illnesses per Month" , color = Month) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#image6
qplot(data=dataset, x=State, y=Illnesses, color = State) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#below graph show relation between year,month,state and Hospitalization

#image7
qplot(data=dataset, x=Year, y=Hospitalizations , main = "Number of Hospitalizations per year" , color = Year)
#image8
qplot(data=dataset, x=Month, y=Hospitalizations,color = Month) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#image9
qplot(data=dataset, x=State, y=Hospitalizations , main = "Number of Hospitalizations per state" , color = State) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#below graph show relation between year,month,state and fetalities

#image10
qplot(data=dataset, x=Year, y=Fatalities , main = "Number of Fatalities per year" , color = Year)
#image11
qplot(data=dataset, x=Month, y=Fatalities, main = "Number of Fatalities per Month" , color = Month) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#image12
qplot(data=dataset, x=State, y=Fatalities , main = "Number of Fatalities per state" , color = State ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
