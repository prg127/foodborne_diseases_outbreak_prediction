


getwd()
#setting the window directory
setwd("c:\\Users\\HP\\Desktop\\Minor2")
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
qplot(data=dataset, x=State , xlab = 'state' ,ylab = 'cases' , main = "Number of cases per state" , color = State) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#below graph show relation between year,month,state and illnesses
#image4
qplot(data=dataset, x=Year, y=Illnesses , main = "Number of illnesses per year" , color = Year)
#image5
qplot(data=dataset, x=Month, y=Illnesses , main = "Number of illnesses per Month" , color = Month) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#image6
qplot(data=dataset, x=State, y=Illnesses , main = "Number of illnesses per state" , color = State) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#below graph show relation between year,month,state and Hospitalization

#image7
qplot(data=dataset, x=Year, y=Hospitalizations , main = "Number of Hospitalizations per year" , color = Year)
#image8
qplot(data=dataset, x=Month, y=Hospitalizations , main = "Number of Hospitalizations per Month" , color = Month) +
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


# #this commnd is used to find the rows with illnesses greater than 1000
# nrow(dataset[dataset$Illnesses > 1000,])
#image13
qplot(data = dataset , x = Illnesses , ylab ='cases',main="Number of illnesses")

#image14
qplot(data = dataset , x =Hospitalizations , ylab ='cases',main="Number of Hospitalization")

#image15
qplot(data = dataset , x = Fatalities , ylab ='cases',main="Number of Fatalities ")

#image16
qplot(data=dataset , x = Hospitalizations , y = Illnesses , colour = I("Blue") , alpha=I(0.5),main='Hospitalization vs illnesses')

#image17
qplot(data=dataset , x = Illnesses , y = Fatalities , colour = I("blue") , alpha = I(0.5) , main = 'Illnesses vs Fatalities')

#image18
qplot(data=dataset , x = Hospitalizations , y = Fatalities , colour = I("blue") , alpha = I(0.5) , main = 'Hospitalizations vs Fatalities')


#qplot(data=dataset,x=Food , size=I(5))

# qplot(data=dataset , x=Fatalities , y=Year ,geom="boxplot")
#image 19
#below graph show how many people hospiltalized particular year with corresponding state
qplot(data=dataset , x=Year,y=Hospitalizations,colour=State,size=I(2),main ='Year vs Hospitalizations with corresponding state')

#below graph show how many fetalities particular year with corresponding state
#image 20
qplot(data=dataset , x=Year,y=Fatalities,colour=State,size=I(2),main = 'Year vs Fatalities with corresponding state')

#below graph show how many people ILL particular year with corresponding state
#image21
qplot(data=dataset , x=Year,y=Illnesses,colour=State,size=I(2),main = 'year vs Illnesses with corresponding state')

#image22



####################################
indices <- dataset[,9]!= 0
pie(table(dataset[,9][indices]),radius = 2,angle = 45)
?pie
####################################

qplot(data=dataset,x=Status) +
theme(axis.text.x = element_text(angle = 90, hjust = 1))



#create different data frame from dataset
#we create a dataframe that consists the year ,illnesses, hospitalizations and fatalities
dataframe1 <- data.frame(dataset$Year,
                         dataset$Illnesses,
                         dataset$Hospitalizations,
                         dataset$Fatalities)
# 
# dataframe2 <- data.frame(dataset$Month ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe3 <- data.frame(dataset$State ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe4 <- data.frame(dataset$Location ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe5 <- data.frame(dataset$Food ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe6 <- data.frame(dataset$Ingredient ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe7 <- data.frame(dataset$Species ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe8 <- data.frame(dataset$Serotype.Genotype ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)
# 
# dataframe9 <- data.frame(dataset$Status ,
#                          dataset$Illnesses,
#                          dataset$Hospitalizations,
#                          dataset$Fatalities)

#we also change the name of column 
# colnames(dataframe1) <- c("","")
#to remove the dataframe 
#rm(dataframe name)
#we also merge two dataframe
#visualization of new dataframe
qplot(data=dataframe1, x=dataset.Year , y=dataset.Illnesses)

qplot(data=dataframe1, x=dataset.Year)
#we also give different shape 
qplot(data=dataframe1,
      x=dataset.Year,
      y=dataset.Illnesses,
      colour=dataset.Year,
      size=I(5),
      shape=I(3))
#for transperancy we use alpha function 
qplot(data=dataframe1,
      x=dataset.Hospitalizations,
      y=dataset.Illnesses,
      colour=dataset.Year,
      size=I(2),
      shape=I(17),
      alpha=I(0.5))
#we also gave the title of the plot that we have made
qplot(data=dataframe1,
      x=dataset.Hospitalizations,
      y=dataset.Illnesses,
      colour=dataset.Year,
      size=I(2),
      shape=I(17),
      alpha=I(0.5),
      main="Illnesses vs Hospitalizations by Year" )

##############################################################
#Now here we used ggplot instead of  qplot for more flexibility to the visualization of data

#-----Aesthetics (this plot is empty)

ggplot(data=dataset , aes(x=Year , y =Illnesses))

#------geometry (then we add some geomectry to the plot)

ggplot(data=dataset , aes(x=Year , y =Illnesses)) +
  geom_point()

# #-------color (then add color to the plot)
# ggplot(data=dataset , aes(x=Year , y = Illnesses , color = State)) + 
#   geom_point()
# 
# #-------size(then add size to the plot)
# 
# ggplot(data=dataset , aes(x=Year , y = Illnesses , color = State , size = State)) + 
#   geom_point()

ggplot(data=dataset , aes(x=Year , y = Illnesses , color = Month)) + 
    geom_point()

ggplot(data=dataset , aes(x=Year , y = Hospitalizations , color = Month , size = Month)) + 
  geom_point()

#----------------ploting with layers

p <- ggplot(data=dataset , aes(x=Year , y = Illnesses , color = Month))
                                                      
p + geom_point()

p + geom_line()

p + geom_line(size = I(5))

p + geom_line() + geom_point() 




# #to calculate the missing entry from the particular column
# sum(is.na(dataset$Location))
# #used For subsetting from the dataset
# data <- subset(dataset, dataset$Location == "Restaurant" & dataset$Food == "Lasagna")
# 
# data <- subset(dataset, dataset$Location == "Restaurant" & dataset$Hospitalizations >10)


#histogram and density charts

s <- ggplot(data=dataset , aes(x=Year)) 

s

s + geom_histogram(binwidth=0.2)

#add colour
#this is what we called setting (here we set the colour)
s + geom_histogram(binwidth=0.2 , fill = "Green")

#this is mapping 

s +  geom_histogram(binwidth=0.2 , aes(fill=State))

#add a border 
s +  geom_histogram(binwidth=0.2 , aes(fill=State) , colour = "Black")

#sometimes we need density chart 

s + geom_density()

s + geom_density(aes(fill = State))

s + geom_density(aes(fill = State),position = "stack")

s + geom_density(aes(fill = Food),position = "stack")

#statistical transformation

U <- ggplot(data=dataset , aes(x=Illnesses, y=Hospitalizations ,color = Month))

XX <- U + geom_point() + geom_smooth()

XX + xlab("No of Illnesses") + ylab("No of hospitalization")

#here in geom_smooth function we also write fill = NA so that only lines are come

#box plot

V <- ggplot(data=dataset , aes(x=Illnesses, y=Hospitalizations ,color = Month))

V + geom_boxplot()

V + geom_boxplot(size = 1.25)

V + geom_boxplot() + geom_point()


# ---------using Facets

# ---------

f <- ggplot(data=dataset , aes(x=Year,y = Status , color = Month))

f + geom_histogram(binwidth=0.2 , aes(fill=State) , colour = "Black")+
  facet_grid(Month~. , scales = "free")

f + geom_point() +
  facet_grid(Month~. , scales = "free")



#lebel encoding location attribute(Nominal attribute) and naming new attribute location
#empty column are lebelled as 2
#there are 162 unique values in location attribute







  




