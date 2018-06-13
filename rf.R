library(rpart)
library(party)
library(partykit)
library(dplyr)

titanic <- read.csv("data/titanic.csv") %>%
  mutate(Survived=factor(Survived))

tree <- rpart(Survived ~ Age + Pclass + Sex + Fare, data=titanic)
plot(as.party(tree), main="Classification Tree (predicting survivorship)")

regression_tree <- rpart(Age ~ Survived + Pclass + Sex + Fare, data=titanic)
plot(as.party(regression_tree), main="Regression Tree (prediting age)")