getwd()
#setting the window directory
setwd("c:\\Users\\Pranav\\Minor Project\\Modified")
getwd()
#Read data from Data.csv file and store in dataset(Data Frame)
dataset <- read.csv("outbreaks.csv")
dataset1 <- read.csv("outbreaks.csv")

#This Approach is Not Suggested
#Removing Observations which have values other than "confirmed" , "suspected" and ""
#Before removing there are 19119 observations and after removing there are 18063 observations
n <- 0
for(unique_value in unique(dataset1$Status)){
  n <- n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset1$Status)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 4:n)
  {
    if(dataset$Status[i] == values[j])
    {
      print(i)
      dataset1 <- dataset1[!grepl(i, dataset1$X) , ]
      break
    }
  }
}

#write dataframe to csv file(Data1.csv)
write.csv(dataset1, "Data1.csv")
dataset <- read.csv("Data1.csv")

#Label Encoding Status Attribute(Binary Attribute) and Naming new Attribute status
#Empty Values are Labelled as '1'
#There are Total '23' Unique Values in Status Attribute
n <- 0 
for(unique_value in unique(dataset$Status)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Status)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Status[i] == values[j])
    {
      dataset$status[i] <- j
      break
    }
  }
}
print("Done")

#All Values set to NA other than "Confirmed"(2), "Suspected"(3), ""(1) in status attribute
for(i in 1:19119)
{
  for(j in 4:n)
  {
    if(dataset$Status[i] == values[j])
    {
      print(i)
      dataset$status[i] <- "NA"
      #dataset1 <- dataset1[!grepl(i, dataset1$X) , ]
      break
    }
  }
}
#For finding empty value position in coloumn
u1 <- 0
for(j in 1:23){
  if(values[j] == ""){
    u1 <- j
  }
}
print(u1)
#Replacing Values 1 with "NA"
dataset$status[dataset$status == u1] <- "NA"

#write dataframe to csv file(Data2.csv)
write.csv(dataset, file="Data2.csv")
dataset1 <- read.csv("Data2.csv")

#install.packages('plyr')
library(plyr)
#count function from "plyr" library gives frequency of every value in status Attribute
a <- count(dataset1, 'status')
max(a$freq)

#Printing value with maximum frequency i.e 7909
for(i in 1:3)
{
  if(a$freq[i] == max(a$freq))
  {
    b <- a$status[i]
    break
  }
}
print(b)

#Replacing'NA' value to value with maximum frequency i.e '2'(Confirmed)
#We assign Confirmed to NA value due to its high Frequency 
for(i in 1:19119)
{
  if(is.na(dataset1$status[i]) == "TRUE")
  {
    dataset1$status[i] <- b
  }
}
print("Done")

#We Considered Confirmed Value to '1' in status attribute
for(i in 1:19119)
{
  if(dataset1$status[i] == 2)
  {
    dataset1$status[i] <- 1
  }
}
print("Done")
#We Considered Suspected Value to '0' in status attribute
for(i in 1:19119)
{
  if(dataset1$status[i] == 3)
  {
    dataset1$status[i] <- 0
  }
}
print("Done")

#write dataframe to csv file(Data3.csv)
write.csv(dataset1, file="Data3.csv")
dataset <- read.csv("Data3.csv")

#Label Encoding Location Attribute(Nominal Attribute) and Naming new Attribute location
#Empty Values are Labelled as '2'
#There are Total '162' Unique Values in Location Attribute
n <- 0 
for(unique_value in unique(dataset$Location)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Location)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Location[i] == values[j])
    {
      dataset$location[i] <- j
      break
    }
  }
}
print("Done")

#For finding empty value position in coloumn
u1 <- 0
for(j in 1:162){
  if(values[j] == ""){
    u1 <- j
  }
}
print(u1)
#Replacing Values 2 with "NA"
dataset$location[dataset$location == u1] <- "NA"

#Label Encoding Food Attribute(Nominal Attribute) and Naming new Attribute food
#Empty Values are Labelled as '1' 
#There are Total '3128' Unique Values in Food Attribute 
n <- 0
for(unique_value in unique(dataset$Food)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Food)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Food[i] == values[j])
    {
      dataset$food[i] <- j
      break
    }
  }
}
print("Done")

#For finding empty value position in coloumn
u2 <- 0
for(j in 1:3128){
  if(values[j] == ""){
    u2 <- j
    break
  }
}
print(u2)
#Replacing Values 1 with "NA"
dataset$food[dataset$food == u2] <- "NA"

#Label Encoding Species Attribute(Nominal Attribute) and Naming new Attribute species
#Empty Values are Labelled as '1' 
#There are Total '202' Unique Values in Species Attribute 
n <- 0
for(unique_value in unique(dataset$Species)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Species)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Species[i] == values[j])
    {
      dataset$species[i] <- j
      break
    }
  }
}
print("Done")

#For finding empty value position in coloumn
u3 <- 0
for(j in 1:202){
  if(values[j] == ""){
    u3 <- j
  }
}
print(u3)
#Replacing Values 1 with "NA"
dataset$species[dataset$species == u3] <- "NA"

#write dataframe to csv file(Data4.csv)
write.csv(dataset, file="Data4.csv")
dataset1 <- read.csv("Data4.csv")

a <- count(dataset1, 'location')
max(a$freq)

#Printing value with maximum frequency i.e 10448
for(i in 1:162)
{
  if(a$freq[i] == max(a$freq))
  {
    b <- a$location[i]
  }
}
print(b)

#Replacing'NA' value to value with maximum frequency i.e '1'
for(i in 1:19119)
{
  if(is.na(dataset1$location[i]) == "TRUE")
  {
    dataset1$location[i] <- b
  }
}
print("Done")

c <- count(dataset1 ,'food')
max(c$freq)
d <- sort(c$freq,decreasing = TRUE)

#Printing value with maximum frequency i.e 8963
for(i in 1:3128)
{
  if(c$freq[i] == max(c$freq))
  {
    print(c$food[i])
    break
  }
}

#Printing value with second maximum frquency i.e 206
e <- 0
for(i in 1:3128)
{
  if(c$freq[i] == 206)
  {
    e <- c$food[i]
    break
  }
}
print(e)

#Replacing'NA' value to value with second maximum frequency i.e '37'
for(i in 1:19119)
{
  if(is.na(dataset1$food[i]) == "TRUE")
  {
    dataset1$food[i] <- e
  }
}
print("Done")

f <- count(dataset1 ,'species')
max(f$freq)
g <- sort(f$freq , decreasing = TRUE)

#Printing value with maximum frequency i.e 6619
for(i in 1:202)
{
  if(f$freq[i] == max(f$freq))
  {
    print(f$species[i])
  }
}

#Printing value with second maximum frquency i.e 2744
h <- 0
for(i in 1:202)
{
  if(f$freq[i] == 2744)
  {
    h <- f$species[i]
  }
}
print(h)

#Replacing'NA' value to value with second maximum frequency i.e '7'
for(i in 1:19119)
{
  if(is.na(dataset1$species[i]) == "TRUE")
  {
    dataset1$species[i] <- h
  }
}
print("Done")

#write dataframe to csv file(Data5.csv)
write.csv(dataset1, "Data5.csv")
dataset <- read.csv("Data5.csv")

#Label Encoding Month Attribute(Nominal Attribute) and Naming new Attribute month
#There are Total '12' Unique Values in Month Attribute
n <- 0
for(unique_value in unique(dataset$Month)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Month)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Month[i] == values[j])
    {
      dataset$month[i] <- j
      break
    }
  }
}
print("Done")

#Label Encoding State Attribute(Nominal Attribute) and Naming new Attribute state
#There are Total '55' Unique Values in state Attribute
n <- 0
for(unique_value in unique(dataset$State)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$State)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$State[i] == values[j])
    {
      dataset$state[i] <- j
      break
    }
  }
}
print("Done")

#Label Encoding Ingredient Attribute(Nominal Attribute) and Naming new Attribute ingredient
#Empty Values are Labelled as '1' 
#There are Total '382' Unique Values in ingredient Attribute
n <- 0
for(unique_value in unique(dataset$Ingredient)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Ingredient)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Ingredient[i] == values[j])
    {
      dataset$ingredient[i] <- j
      break
    }
  }
}
print("Done")
#Replacing Values 1 with "NA"
dataset$ingredient[dataset$ingredient == 1] <- "NA"

#Label Encoding Serotype.Genotype Attribute(Nominal Attribute) and Naming new Attribute serotype.Genotype
#Empty Values are Labelled as '1' 
#There are Total '240' Unique Values in Serotype.Genotype Attribute 
n <- 0
for(unique_value in unique(dataset$Serotype.Genotype)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(dataset$Serotype.Genotype)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(dataset$Serotype.Genotype[i] == values[j])
    {
      dataset$serotype.Genotype[i] <- j
      break
    }
  }
}
print("Done")
#Replacing Values 1 with "NA"
dataset$serotype.Genotype[dataset$serotype.Genotype == 1] <- "NA"

#write dataframe to csv file(Data6.csv)
write.csv(dataset, "Data6.csv")
dataset1 <- read.csv("Data6.csv")

c<-count(dataset1 ,'ingredient')
max(c$freq)
f <- sort(c$freq , decreasing = TRUE)

#Printing value with maximum frequency i.e 17243
for(i in 1:382)
{
  if(c$freq[i] == max(c$freq))
  {
    print(c$ingredient[i])
    break
  }
}

#Printing value with second maximum frquency i.e 190
for(i in 1:382)
{
  if(c$freq[i] == 190)
  {
    g <- c$ingredient[i]
    break
  }
}
print(g)

#Replacing'NA' value to value with second maximum frequency i.e 6
for(i in 1:19119)
{
  if(is.na(dataset1$ingredient[i]) == "TRUE")
  {
    dataset1$ingredient[i] <- g
  }
}
print("Done")

d<-count(dataset1 ,'serotype.Genotype')
max(d$freq)
f <- sort(d$freq , decreasing = TRUE)

#Printing value with maximum frequency i.e 15212
for(i in 1:240)
{
  if(d$freq[i] == max(d$freq))
  {
    print(d$serotype.Genotype[i])
  }
}

#Printing value with second maximum frquency i.e 690
for(i in 1:240)
{
  if(d$freq[i] == 690)
  {
    g <- d$serotype.Genotype[i]
  }
}
print(g)

#Replacing'NA' value to value with second maximum frequency i.e 9
for(i in 1:19119)
{
  if(is.na(dataset1$serotype.Genotype[i]) == "TRUE")
  {
    dataset1$serotype.Genotype[i] <- g
  }
}
print("Done")

#Filling the missing entry of Hospitalizations attribute
dataset$Hospitalizations = ifelse(is.na(dataset$Hospitalizations),
                                  ave(dataset$Hospitalizations,FUN = function(x) mean(x,na.rm = TRUE)),
                                  dataset$Hospitalizations)
#Filling the missing entry of Fatalities attribute
dataset$Fatalities = ifelse(is.na(dataset$Fatalities),
                            ave(dataset$Fatalities,FUN = function(x) mean(x,na.rm = TRUE)),
                            dataset$Fatalities)

#Filling the missing entry of Illnesses attribute
dataset$Illnesses = ifelse(is.na(dataset$Illnesses),
                           ave(dataset$Illnesses,FUN = function(x) mean(x,na.rm = TRUE)),
                           dataset$Illnesses)

#Write the dataframe in cleandata.csv
write.csv(dataset1,'Cleandata.csv')
dataset <- read.csv('Cleandata.csv')

dataset$X.6 <- NULL
dataset$X.5 <- NULL
dataset$X.4 <- NULL
dataset$X.3 <- NULL
dataset$X.2 <- NULL
dataset$X.1 <- NULL
dataset$X <- NULL
dataset$Month <- NULL
dataset$State <- NULL
dataset$Location <- NULL
dataset$Food <- NULL
dataset$Species <- NULL
dataset$Ingredient <- NULL
dataset$Serotype.Genotype <- NULL
dataset$Status <- NULL

#after removing all duplicate column from the dataframe write in the final data to csv file("Output.csv")
write.csv(dataset, "Output.csv")
dataset <- read.csv("Output.csv")
