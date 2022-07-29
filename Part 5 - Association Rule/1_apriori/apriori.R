# Apriori

# Data Preprocessing
# install.packages('arules')
library(arules)
data_file = '../Market_Basket_Optimisation.csv'
dataset = read.csv(data_file, header = FALSE)
# Convert dataset to a Sparse Matrix & remove duplicates
dataset = read.transactions(data_file, sep = ',', rm.duplicates = TRUE)
summary(dataset)
# use a function to plot item frequency from arules package
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset (minlen defaults to 1)
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))
# update the confidence value and check the nbr of Rules you get each update.

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])