dataset = read.csv('cleaneddata.csv')
dataset$X <-NULL
dataset = dataset[c(2,3,4,5,6,7,8,9,12)]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Status, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-9] = scale(training_set[-9])
test_set[-9] = scale(test_set[-9])

# Fitting Decision Tree Classification to the Training set
# install.packages('rpart')
library(rpart)


