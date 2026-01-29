#  install.packages("titanic")

library(tidyverse)
library(titanic)

# Data cleaning & preprocessing ================================
titanic_df <- titanic_train

titanic_df <- titanic_df |>
  select(Survived, Pclass, Sex, Age, Fare) |>
  filter(!is.na(Age)) |>
  mutate(
    Survived = factor(Survived, levels = c(0, 1)),
    Sex = factor(Sex, levels = c("male", "female"))
  )

# Descriptive summary============
titanic_df %>% 
  group_by(Sex, Pclass) %>% 
  summarise(mean(Age), n())

mean(titanic_df$Age)

## Model creation ==============================

model <- glm(Survived ~ Pclass + Sex + Age ,data = titanic_df,family = binomial)
summary(model)
coef(model)
exp(coef(model))
exp(coef(model)[-1])  # odds ratio # console e check exp()



# Each increase in class decreases survival odds by 72% (since odds = 0.28).    
# Females were 92% more likely to survive than males.     
# Males are 92% less likely to survive than females.    
# Each year increase in age decreases odds of survival by 4%.   
# Fare has no meaningful effect.

####### https://archive.ics.uci.edu


# Create data for prediction=========================
new_data <- data.frame(
  Pclass = c(1, 2, 3),  
  Sex = factor(c("male", "female", "female"), levels = c("male", "female")),
  Age = c(30, 25, 40)
) # must check data type like factor, numeric


# prediction result===================
new_data$link <- predict(model, newdata = new_data, type = "link") # log(odds)
new_data

new_data$Predicted_Prob <- predict(model, newdata = new_data, type = "response")
new_data # value >.5 survived 

new_data$terms <- predict(model, newdata = new_data, type = "terms")
new_data


# predict using test data ========================

test_dat <- titanic_test

test_dat$Predicted <- predict(model, test_dat, type = "response")
test_dat$Survived <- ifelse(test_dat$Predicted >= 0.5, "Yes", "No")


# Evaluation Metrices==========================
#Predict survival using the model (threshold = 0.5):
predicted_class <- ifelse(predict(model, type = "response") >= 0.5, 1, 0)  # Convert probability to class
# for see prediction data type in console= table(predicted_class)
# for see Actual data type in console= table(titanic_df$Survived)
# cross table = table(predicted_class,titanic_df$Survived)

## Confusion Metrix============================

#install.packages("caret")
library(caret)
caret::confusionMatrix(factor(predicted_class), titanic_df$Survived)
caret::confusionMatrix(factor(predicted_class), titanic_df$Survived, mode = "prec_recall")


## ROC Curve====================================
library(pROC)

predicted_prob <- predict(model, type = "response")
roc_curve <- roc(titanic_df$Survived, predicted_prob)

plot(roc_curve, col = "red", main = "ROC Curve for Titanic Survival Model")

auc_value <- auc(roc_curve)
print(paste("AUC:", auc_value))


##R square value=====================
null_model <- glm(Survived ~ 1, data = titanic_df, family = binomial)  # Null model (only intercept, no predictors)
R2 <- 1 - (logLik(model) / logLik(null_model))
print(paste("McFadden's R-squared:", R2 |> round(3)))
 
# R squared > 0.2: Good model.
# R squared > 0.4: Strong model.

