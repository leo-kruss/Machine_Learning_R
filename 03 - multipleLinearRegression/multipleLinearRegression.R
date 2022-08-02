#Multiple Linear Regression

#importing the dataset
dataset = read.csv('/home/leonardokruss/Documentos/Code/Machine_Learning_R/03 - multipleLinearRegression/50_Startups.csv')
# dataset = dataset[, 2:3]

#encoding categorical data
dataset$State = factor(dataset$State, levels = c('New York', 'California', 'Florida'), labels = c(1, 2, 3))

#splitting the dataset into the training set and test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

#fitting multiple linear regression to the training set
#Simple way to write formula:
# regressor = lm(formula = Profit ~ .)
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = training_set)

#predicting the test set results
y_pred = predict(regressor, newdata = test_set)

#building the optimal model using backward elimination
regressor = lm(formula = Profit ~ .)

