#### This code contains all the code created to analyse the "wine.csv" data set
#### found in the Portugal-Wine/data directory

# Set working repository
setwd("C:/Users/hugob/Desktop/Personal Projects/DataAnalyses/Portugal Wine")

# Install necessary packages
library(ggplot2)
library(car)
library(MASS)

# Load data - used the second version due to ; separator on csv file
df<-read.csv2("data/wine.csv")

# Change data type of several columns from chr to numeric
df[,c(1:11)]<-sapply(df[,c(1:11)], as.numeric)

# Create a model with all variables taking into account quality as a dependent 
# variable
model<-lm(quality ~ ., data=df)

# Applies the stepwise regression process to decide which
# predictors to use in the final model
step_model<-stepAIC(model, direction="both", trace=FALSE)

# Added regression diagnostic to the step_model
par(mfrow=c(1,2), oma = c(3,2,3,2) + 0.1, mar = c(1,1,1,1) + 0.1)
truehist(residuals(step_model), h = 0.25, col="slategray3")
qqPlot(residuals(step_model), pch=19, col="darkblue", cex=0.6)
mtext("Distribution of Residuals", outer=T, side=1, line = 2)