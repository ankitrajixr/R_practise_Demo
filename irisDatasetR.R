iris
head(iris)
plot(iris)
#Solution Using LDA
require(MASS)
lda_output=lda(Species~.,data=iris)


library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + geom_point(aes(shape = Species))


#LDA Confusion matrix
f <- table(Observed=iris$Species, Predicted=pred$class)
f
sum(diag(f))/sum(f)
#OR other method to find confusion matrix
library(caret)
#Accuracy is the OR in this Confusion marix
confusionMatrix(iris$Species, pred$class)

#Solution using RarandomForest()
rf=cforest(Species~.,data=iris)
# Prediction & Confusion Matrix - train data
library(caret)
p1 <- predict(rf)
confusionMatrix(iris$Species, p1)
#Accuracy is the OR in this Confusion marix

#decision tress
Dt_output <- ctree(Species ~ ., data = iris)
# Prediction & Confusion Matrix - train data
library(caret)
p_Dt <- predict(Dt_output)
confusionMatrix(iris$Species, p_Dt)
results <- resamples(list(lda=lda_output, rf=rf))
summary(results)
