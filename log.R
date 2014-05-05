#First step - load data

deps <- read.csv("~/Documents/Data/data-deportations/deps.csv")
#originally from: https://www.dhs.gov/sites/default/files/publications/ois_yb_2012.pdf
View(deps)

#Second step - graph
install.packages("ggplot2")
install.packages("reshape")
install.packages("reshape2")
require(ggplot2)
require(reshape2)
require(reshape)
qplot(deps$Year, deps$Removals)

deps_m <- melt(deps)
deps_m <- rename(deps_m, c(X1 = "Year", X2 = "Count"))
View(deps_m)

#Altogether, returns and removals:

ggplot(deps_m, aes(value, Returns+Removals, fill = variable)) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Deportations") +
  ggtitle("Deportations from 1892 to 2012") + 
  guides(fill=FALSE)

#Just removals:

ggplot(deps_m, aes(value, Removals, fill = variable)) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Deportations") +
  ggtitle("Deportations from 1892 to 2012 (Removals)") + 
  guides(fill=FALSE)

#Just returns:

ggplot(deps_m, aes(value, Returns, fill = variable)) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Deportations") +
  ggtitle("Deportations from 1892 to 2012 (Returns)") + 
  guides(fill=FALSE)