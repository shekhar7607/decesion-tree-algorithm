colnames(mtcars)
library(caTools)
str( mtcars)
#################################################################################
######set.seed function is used for same splitting every time####################
#################################################################################
set.seed(10)

##################################################################################
#########After splitting we get 67% of true value and 33% of false value##########
##################################################################################
split <- sample.split(mtcars$vs, SplitRatio = 2/3)



train <- mtcars[split,]
##################################################################################
####### we are training with 67% true value and 33% false value.##################
##################################################################################
dim(train)
head(train)
test <- mtcars[!split,]
dim(split)
head(test)

##################################################################################
###### We are applying decesion tree algorithm for predicting classification i.e##
######categorical variable.#######################################################
library(tree)

tree.am <- tree(data = train, vs ~ .)
summary(tree.am)
# Classification tree:
#   tree(formula = vs ~ ., data = train)
# Variables actually used in tree construction:
#   [1] "qsec" "mpg" 
# Number of terminal nodes:  3 
# Residual mean deviance:  0.278 = 5.004 / 18 
# Misclassification error rate: 0.04762 = 1 / 21 

plot(tree.am)
text(tree.am, pretty = 0)

####################################################################################
####Applying random forest##########################################################
####################################################################################
library(randomForest)

bag <- randomForest(vs ~ ., data = train, ntry = 6, importance = TRUE)
varImpPlot(bag)



