# Step1 is to set working directory
setwd('C:/Users/rashm/Desktop/ECODERS_Datasets/regression_algorithms/02_multiple_linear_regression/50_startup_project/Multiple_Linear_Regression')
dataset = read.csv('50_Startups.csv')
#step3 
#encoding for the catogorical column state
dataset$State = factor(dataset$State,
                       levels = c("New York", "California",  "Florida"),
                       labels = c(1,2,3))
dataset$State

#step4  :-  splitting the data into training set and test set using library caTools
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset , SplitRatio = 0.8)
training_set = subset(dataset, split = TRUE)
test_set = subset(dataset , split = FALSE)

#step5 :- feature scalling  not required cos caTools library will take care 

#step 6 : fitting the model to the traiining set , independent vs dependent variable
regressor  =  lm(formula  =  Profit ~ .  , data = training_set)

#step 7 :- printing the summary of the regressor
summary(regressor)

#step 8 :- predicting the resutls lets say y_pred values on the test_Set
y_pred = predict(regressor, newdata = test_set)
y_pred   #machine predictions

test_set   # actual values 

#step 9 :- finding the higly significant variable that will achieve by backwards elemination algorithm
regressor = lm(Profit ~ R.D.Spend+Administration+Marketing.Spend+State, data = dataset)
regressor
summary(regressor)

#step 10 :- removing state2 column and building the regressor again
regressor = lm(Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
regressor
summary(regressor)


#step 11 :- removing Adminsitration column and building the regressor again
regressor = lm(Profit ~ R.D.Spend +  Marketing.Spend, data = dataset)
regressor
summary(regressor)

#step 12 :- removing marketing column and building the regressor again
regressor = lm(Profit ~ R.D.Spend , data = dataset)
regressor
summary(regressor)

#step 13
print("conclusion")
print("R n D  is the most significant columns to invest in")















