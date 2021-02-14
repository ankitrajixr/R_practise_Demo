getwd()
setwd("E:/SRH/2nd Semester/Analytics 2/data")
clinical_study_df <- read.table(file="ClinicalStudy.txt", header = TRUE, dec = ",")
View(clinical_study)

library(dplyr)
summary(clinical_study_df)
clinical_study_df$sex <- factor(clinical_study_df$sex,labels=c("Male","Female"))
clinical_study_df$group <- factor(clinical_study_df$group,labels=c("Control", "Intervention"))
summary(clinical_study_df)
str(clinical_study_df)
?aggregate

str(clinical_study_df)
aggregate(score ~ group, data=clinical_study_df, FUN="mean")
aggregate(score ~ sex, data=clinical_study_df, FUN="mean")
aggregate(score ~ group+sex, data=clinical_study_df, FUN="mean")
fit <- aov(score ~ group*sex, data=clinical_study_df)
summary(fit)
par(mfrow=c(1,2))
boxplot(score ~ group, data=clinical_study_df)
boxplot(score ~ sex, data=clinical_study_df)
require(lattice)
p <- bwplot(score ~ group, data=clinical_study_df)
p
p <- bwplot(score ~ sex, data=clinical_study_df)
p
p <- bwplot(score ~ group | sex, data=clinical_study_df)
p
m <- xtabs(~group + sex, data=clinical_study_df)
m
mosaicplot(m,shade=TRUE)
?mosaicplot
