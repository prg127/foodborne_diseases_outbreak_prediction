#Reading fram from csv file(Data3_Modified.csv)
data <- read.csv("Data3_Modified.csv")
#Removing Coloumns which are unnecessary
data$X.2 <- NULL
data$X.1 <- NULL
data$X <- NULL
data$Status <- NULL
setwd("C:\\Users\\Pranav\\Minor Project\\Modified")
getwd()
#Reading coloumns which are required and changing coloumn names
data <- data.frame(data$Location, data$Food, data$status)
colnames(data)[colnames(data)=="data.Location"] <- "Location"
colnames(data)[colnames(data)=="data.Food"] <- "Food"
colnames(data)[colnames(data)=="data.status"] <- "Status"

write.csv(data,"Required.csv")
#Taking Loaction as input from user and Predicting the status using data in the dataset
#Status will be the value with the highest frequency
Loc <- "Restaurant"
c0 <- 0; c1 <- 0
for(i in 1:19119)
{
  if(data$Location[i] == Loc)
  {
    if(data$Status[i] == "1") {
      c1 <- c1+1;
    } else {
      c0 <- c0+1;
    }
  }
}

if(c1 >= c0) {
  print("The Status is Confirmed")
} else {
  print("The Status is Suspected")
}

# x <- c("abcedfge ")
# y <- unlist(strsplit(x,"e"))
# length(y)

#Taking Loaction as input from user and Predicting the status using data in the dataset
#Spliting Loaction that user entered and used further
L_in <- "Private Home/Residence"
Loc <- unlist(strsplit(L_in, "/"))
m <- length(Loc)

#Spliting Locations which are in dataset and Verified with user entered Location
#Status will be the value with the highest frequency
c0 <- 0; c1 <- 0
for(i in 1:100)
{
  Act_Loc <- unlist(strsplit(toString(data$Location[i]), "/"))
  n <- length(Act_Loc)
  print(n)
  if(n != 0){
    for(j in 1:n){
      for(k in 1:m){
        if(Act_Loc[j] == Loc[k]){
          if(data$Status[i] == "1") {
            c1 <- c1+1;
          } else {
            c0 <- c0+1;
          }
        }
        break
      }
    }
  }
}

#Taking Food as input from user and Predicting the status using data in the dataset
#Spliting Food that user entered and used further
F_in <- "Fish"
food <- unlist(strsplit(F_in, "/"))
m <- length(food)

#Spliting Food_Values which are in dataset and Verified with user entered Food
#Status will be the value with the highest frequency
c0 <- 0; c1 <- 0
for(i in 1:100)
{
  Act_Food <- unlist(strsplit(toString(data$Food[i]), "/"))
  n <- length(Act_Food)
  print(n)
  if(n != 0){
    for(j in 1:n){
      for(k in 1:m){
        if(Act_Food[j] == food[k]){
          if(data$Status[i] == "1") {
            c1 <- c1+1;
          } else {
            c0 <- c0+1;
          }
        }
        break
      }
    }
  }
}


#Spliting Food_Values which are in dataset and Verified with user entered Food
#Expected Status will be the value with the highest frequency
#Prediction of Expected Status using user entered Food along with the Food_values in dataset
#which has corresponding Status same as the expected Status
c0 <- 0; c1 <- 0
for(i in 1:19119)
{
  Act_Food <- unlist(strsplit(toString(data$Food[i]), "/"))
  n <- length(Act_Food)
  #print(n)
  if(n != 0){
    for(j in 1:n){
      for(k in 1:m){
        if(Act_Food[j] == food[k]){
          if(data$Status[i] == "1") {
            Result <- cat("Your Illness will be Confirmed if you eat",food[k],"along with ")
            for(j in 1:n){
              if(Act_Food[j] != food[k]){
                Result <- cat(Act_Food[j])
              }
            }
            o <- length(Result)
            for(l in 1:o-4){
              Output = cat(Result[l])
            }
            Output <- cat("\n")
            paste(Output)
          } else {
            Result <- cat("Your Illness will be Suspected if you eat",food[k],"along with ")
            for(j in 1:n){
              if(Act_Food[j] != food[k]){
                Result <- cat(Act_Food[j])
              }
            }
            o <- length(Result)
            for(l in 1:o-4){
              Output = cat(Result[l])
            }
            Output <- cat("\n")
            paste(Output)
          }
        }
        break
      }
    }
  }
}

