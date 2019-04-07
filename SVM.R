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

#fitting svm to the training set
install.packages('e1071')
library(e1071)
classifier = svm(formula = Status ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')


y_pred = predict(classifier,newdata = test_set[-9])

y_pred

cm = table(test_set[, 9],y_pred)

cm

#accuracy 77%

