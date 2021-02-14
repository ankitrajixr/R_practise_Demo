install.packages(c("arules", "arulesViz"))
library("arules")
data("Adult")
head(Adult)

rules <- apriori(Adult, parameter = list(supp = 0.5, conf = 0.9, target = "rules"))

summary(rules)

inspect(head(rules, by = "lift"))

library(arulesViz)


plot(rules)

plot(head(sort(rules, by = "lift"), n=15), method = "graph", control=list(cex=.8))

dis <- dissimilarity(Adult, method = "phi", which = "items")
plot(hclust(dis, method="complete"), cex=.5)

