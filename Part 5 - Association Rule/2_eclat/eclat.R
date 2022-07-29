# Eclat

# Data Preprocessing
# install.packages('arules')
library(arules)
data_file = '../Market_Basket_Optimisation.csv'
dataset = read.csv(data_file)
# Convert dataset to a Sparse Matrix & remove duplicates
dataset = read.transactions(data_file, sep = ',', rm.duplicates = TRUE)
summary(dataset)
# use a function to plot item frequency from arules package
itemFrequencyPlot(dataset, topN = 10)

# Training Eclat on the dataset
rules = eclat(data = dataset, parameter = list(support = 0.003, minlen = 2))
# There is no confidence value for Eclat, and:
# minlen=2 which means we want to have a different set with at least 2 items mosts frequently purchased together.

# Visualising the results sorted by support level
inspect(sort(rules, by = 'support')[1:10])