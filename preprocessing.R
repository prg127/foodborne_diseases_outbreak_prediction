





#########################33

for(i in 1:19119)
{
  if(is.na(dataset$Status[i]) == FALSE)
  {
  if(dataset$Status[i] == "Suspected; Confirmed")
  {
    dataset$Status[i] = "NA"
  }
  }
  print("done")
}

a <- data.frame(summary(data$Status))

write.csv(dataset,'cleandata1.csv')


data <- read.csv("cleandata1.csv")


for(i in 1:19119)
{
  if(is.na(data$Status[i]) == TRUE)
  {
    data$Status[i] = "Confirmed"
  }
  print("done")
}


write.csv(data,'cleandata2.csv')

data1 <-  read.csv("cleandata2.csv")

data1$X.1 <- NULL
data1$X  <- NULL


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




#####

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

############

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



dataset$ingredient[dataset$ingredient == 1] <- "NA"

b <- count(dataset,'ingredient')




n <- 0
for(unique_value in unique(data1$)){
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

