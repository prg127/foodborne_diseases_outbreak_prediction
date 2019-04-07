getwd()
#setting the window directory
setwd("c:\\Users\\NANDU\\Desktop\\Projects-Even Sem 2019\\Minor Project")
getwd()
dataset <- read.csv("outbreaks.csv")
dataset1 <- read.csv("Data.csv")
dataset <- read.csv("finalcleandata.csv")

#Label Encoding Location Attribute(Nominal Attribute) and Naming new Attribute location
#Empty Values are Labelled as '2'
#There are Total '162' Unique Values in Location Attribute
n <- 0
for(unique_value in unique(data1$Location)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Location)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Location[i] == values[j])
    {
      data1$location[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

#Replacing Values 2 with "NA"
data1$location[data1$location == 2] <- "NA"

data1$Location <- NULL
#Label Encoding Food Attribute(Nominal Attribute) and Naming new Attribute food
#Empty Values are Labelled as '1' 
#There are Total '3128' Unique Values in Food Attribute 
n <- 0
for(unique_value in unique(data1$Food)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Food)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Food[i] == values[j])
    {
      data1$food[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

#Replacing Values 1 with "NA"
data1$food[data1$food == 1] <- "NA"

data1$Food<-NULL

#Label Encoding Species Attribute(Nominal Attribute) and Naming new Attribute species
#Empty Values are Labelled as '1' 
#There are Total '202' Unique Values in Food Attribute 
n <- 0
for(unique_value in unique(data1$Species)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Species)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Species[i] == values[j])
    {
      data$species[i] <- j
      break
    }
  }
}
print("Done")

data1$Species <- NULL



#Replacing Values 1 with "NA"
data1$species[data1$species == 1] <- "NA"

write.csv(dataset, file="Data.csv")

library(plyr)
a<-count(data2, 'location')



max(a$freq)

for(i in 1:162)
{
  if(a$freq[i] == max(a$freq))
     {
    print(a$location[i])
       
  }
}

for(i in 1:19119)
{
  if(is.na(data2$location[i]) == "TRUE")
  {
    data2$location[i] <- 1
  }
  print("done")
}

b<-count(data2 ,'food')
max(b$freq)
d<- sort(b$freq,decreasing = TRUE)
e<-0
for(i in 1:2279)
{
  if(b$freq[i]==191)
  {
   e <- b$food[i]
  }
}

for(i in 1:162)
{
  if(b$freq[i] == max(b$freq))
  {
    print(b$food[i])
    
  }
}

for(i in 1:19119)
{
  if(is.na(data2$food[i]) == "TRUE")
  {
    data2$food[i] <- 37
  }
}

c<-count(dataset1 ,'species')

f <- sort(c$freq , decreasing = TRUE)
g<-0
for(i in 1:202)
{
  if(c$freq[i] == 2744)
  {
    g <- c$species[i]
  }
}

for(i in 1:202)
{
  if(b$freq[i] == max(b$freq))
  {
    print(b$food[i])
    
  }
}

for(i in 1:19119)
{
  if(is.na(data2$species[i]) == "TRUE")
  {
    data2$species[i] <- 7
  }
  print("done")
}



#####################
n <- 0
for(unique_value in unique(data1$Status)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Status)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Status[i] == values[j])
    {
      data1$status[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

data1$Status <- NULL
##################
n <- 0
for(unique_value in unique(data1$Month)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Month)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Month[i] == values[j])
    {
      data1$month[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

data1$Month <- NULL

##################################

n <- 0
for(unique_value in unique(data1$State)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$State)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$State[i] == values[j])
    {
      data1$state[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

data1$State <- NULL


######################
n <- 0
for(unique_value in unique(data1$Ingredient)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Ingredient)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Ingredient[i] == values[j])
    {
      data1$ingredient[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

data1$ingredient[data1$ingredient == 1] <- "NA"

data1$Ingredient <- NULL

############################

n <- 0
for(unique_value in unique(data1$Serotype.Genotype)){
  n = n+1
}
print(n)

values <- c(seq(1:n))
i <- 1
for(unique_value in unique(data1$Serotype.Genotype)){
  values[i] <- unique_value
  print(values[i])
  i <- i+1
}

for(i in 1:19119)
{
  for(j in 1:n)
  {
    if(data1$Serotype.Genotype[i] == values[j])
    {
      data1$serotype.Genotype[i] <- j
      break
    }
  }
  print("done")
}
print("Done")

data1$serotype.Genotype[data1$serotype.Genotype == 1] <- "NA"

data1$Serotype.Genotype <- NULL



#filling the missing entry of Hospitalizations attribute
data2$Hospitalizations = ifelse(is.na(data2$Hospitalizations),
                                  ave(data2$Hospitalizations,FUN = function(x) mean(x,na.rm = TRUE)),
                                  data2$Hospitalizations)
#filling the missing entry of Hospitalizations attribute
data2$Fatalities = ifelse(is.na(data2$Fatalities),
                            ave(data2$Fatalities,FUN = function(x) mean(x,na.rm = TRUE)),
                            data2$Fatalities)

data2$Illnesses = ifelse(is.na(data2$Illnesses),
                           ave(data2$Illnesses,FUN = function(x) mean(x,na.rm = TRUE)),
                           data2$Illnesses)


######################
c<-count(data2 ,'ingredient')

f <- sort(c$freq , decreasing = TRUE)
g<-0
for(i in 1:382)
{
  if(c$freq[i] == 190)
  {
    g <- c$ingredient[i]
  }
}

for(i in 1:382)
{
  if(c$freq[i] == max(c$freq))
  {
    print(c$ingredient[i])
    
  }
}

for(i in 1:19119)
{
  if(is.na(data2$ingredient[i]) == "TRUE")
  {
    data2$ingredient[i] <- g
  }
  print("done")
}


#############

d<-count(data2 ,'serotype.Genotype')

f <- sort(d$freq , decreasing = TRUE)

g<-0
for(i in 1:240)
{
  if(d$freq[i] == 690)
  {
    g <- d$serotype.Genotype[i]
  }
}

# for(i in 1:382)
# {
#   if(c$freq[i] == max(c$freq))
#   {
#     print(c$ingredient[i])
#     
#   }
# }

for(i in 1:19119)
{
  if(is.na(data2$serotype.Genotype[i]) == "TRUE")
  {
    data2$serotype.Genotype[i] <- g
  }
  print("done")
}


# #to store all the summary of col status in dataframe a
# a <- data.frame(summary(dataset$Status))

write.csv(data1,'cleandata3.csv')

data2 <- read.csv('cleandata3.csv')
data2$X <- NULL

write.csv(dataset,'cleaneddata.csv')


dataset$X <-NULL
dataset <- dataset[c("Year", "month", "state","location","food","species","ingredient","serotype.Genotype","Illnesses","Hospitalizations","Fatalities","status")]
colnames(dataset) <- c("Year", "Month", "State","Location","Food","Species","Ingredient","Serotype.Genotype","Illnesses","Hospitalizations","Fatalities","Status")

a <- count(dataset,'status')

for(i in 1:19119)
{
  if(dataset$status[i] == 2)
  {
    dataset$status[i] = 1
  }
}
