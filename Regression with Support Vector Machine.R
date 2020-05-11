# Import Data #
df <- read.csv("E:/My Dictionary/Using R/Data/Movie_regression.csv")
View(df)

# Data Preprocessing #
summary(df) #there are missing values in variable Time_taken
df$Time_taken[is.na(df$Time_taken)] <- mean(df$Time_taken,na.rm = TRUE)

# Test-Train Split
install.packages('caTools')
library(caTools)
set.seed(0)
split <- sample.split(df,SplitRatio = 0.8)
train <- subset(df,split == TRUE)
test <- subset(df,split == FALSE)

############################### MODELING #################################
install.packages('e1071')
library (e1071)

svmfit = svm(Collection~., data=train , kernel = "linear", cost =0.01, scale = TRUE )
summary (svmfit)
predict <- predict (svmfit ,test)
head(predict)
RMSE <- sqrt(mean((predict-test$Collection)^2))
RMSE
