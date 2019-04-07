
dataframe1 <- data.frame(dataset$location,
                         dataset$food,
                         dataset$species)


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataframe1$dataset.species, SplitRatio = 0.8)
training_set = subset(dataframe1, split == TRUE)
test_set = subset(dataframe1, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


 install.packages('h2o')
library(h2o)
 h2o.init(nthreads = -1)
 classifier = h2o.deeplearning(y = 'dataset.species',
                               training_frame = as.h2o(training_set),
                               activation = 'Rectifier',
                               hidden = c(2,2),
                               epochs = 100,
                               train_samples_per_iteration = -2)
 
 y_pred = h2o.predict(classifier, newdata = as.h2o(test_set[-3]))
 y_pred = as.vector(y_pred)
 
 cm = table(test_set[, 3], y_pred)
 
 cm
 
 