# Artificial Neural Network

# Importing the dataset
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
# Fitting ANN to the Training set
# install.packages('h2o')
library(h2o)
h2o.init(nthreads = -1)
model = h2o.deeplearning(y = 'Status',
    training_frame = as.h2o(training_set),
    activation = 'Rectifier',
    hidden = c(5,5),
    epochs = 100,
    train_samples_per_iteration = -2)


# Predicting the Test set results
y_pred = h2o.predict(model, newdata = as.h2o(test_set[-9]))
y_pred = h2o.predict(model, test_set[-9])
y_pred_final = (y_pred > 0.5)
y_pred_final = as.vector(y_pred_final)
cm = table(test_set[, 9], y_pred_final)

cm
# h2o.shutdown()


# install.packages('pROC')
# library('pROC')
# hf <- as.h2o(test_set)
# 
# predictions <- predict(model,hf,type='prob')
# p <- as.factor(predictions)
# p <- as.h2o(p)
# p
# a <- as.data.frame(hf)
# b <- as.data.frame(p)
# auc <- auc(a[,9],y_pred_final)
# plot(roc(a[,9],y_pred_final))
# 
# auc





