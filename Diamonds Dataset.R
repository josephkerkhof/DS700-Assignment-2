# DS 700, Assignment 2, Section 3
# Written by: Joseph Kerkhof
# Professor: Rakesh Kaushika

install.packages('ggplot2', dep = TRUE)
require(ggplot2)
data(diamonds)
# histogram
ggplot(data=diamonds) + geom_histogram(aes(x=carat))
# scatterplot with color
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(aes(color=color))
# boxplot
ggplot(data=diamonds, aes(y=carat, x=1)) + geom_boxplot()
# violin plot of carats by cut
ggplot(data=diamonds, aes(y=carat, x=cut)) + geom_violin()
# getting the head of the diamonds dataset
head(diamonds)
# getting the summary of the diamonds dataset
summary(diamonds)