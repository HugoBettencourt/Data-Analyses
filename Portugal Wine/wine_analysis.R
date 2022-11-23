#### This code contains all the code created to analyse the "wine.csv" data set
#### found in the Portugal-Wine/data directory

# Set working repository
setwd("C:/Users/hugob/Desktop/Personal Projects/DataAnalyses/Portugal Wine")

# Install necessary packages
library(ggplot2)
library(car)

# Load data - used the second version due to ; separator on csv file
df<-read.csv2("data/wine.csv")

# Change data type of several columns from chr to numeric
df[,c(1:11)]<-sapply(df[,c(1:11)], as.numeric)

# Create a model with all variables taking into account quality as a dependent 
# variable
model<-lm(quality ~ ., data=df)

model2<-step(lm(quality ~ 1, df), scope=list(lower=~1, upper=~fixed_acidity+volatile_acidity+citric_acid+residual_sugar+chlorides+free_sulfur_dioxide+total_sulfur_dioxide+pH+sulphates+alcohol), direction="forward")