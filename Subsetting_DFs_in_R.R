education <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/robustbase/education.csv", 
                      stringsAsFactors = FALSE)
colnames(education) <- c("X", "State", "Region", "Urban.Population", "Per.Capita.Income", "Minor.Population", 
                         "Education.Expenditure")
summary(education)
View(education)
head(education)

ed_exp1 <- education[c(10:21),c(2,6:7)]
ed_exp1

# ed_exp2 gives the same result as ed_exp1

ed_exp2 <- education[-c(1:9, 22:50), -c(1, 3:5)]
ed_exp2

ed_exp3 <- education[which(education$Region==2), names(education) %in% c("State", 
                                     "Minor.Population", "Education.Expenditure")]
ed_exp3

ed_exp4 <- subset(education, Region==2, select=c("State", "Minor.Population", "Education.Expenditure"))
ed_exp4

# Two useful functions from "dplyr" package : 

#     - filter : the first argument is the data frame; the second argument is the condition 
#         by which we want it subsetted. The result is the entire data frame with only the 
#         rows we wanted.
#     - select : the first argument is the data frame; the second argument is the names of 
#         the columns we want selected from it. We don’t have to use the names() function,
#         and we don’t even have to use quotation marks. We simply list the column names as 
#         objects.


install.packages("dplyr")
library(dplyr)
ed_exp5 <- select(filter(education, Region==2), c(State, 
                                            Minor.Population, Education.Expenditure))
ed_exp5 
