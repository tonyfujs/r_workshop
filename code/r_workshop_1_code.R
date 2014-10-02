### Set-up default options
options(stringsAsFactors = FALSE)
library(Hmisc)
library(ggplot2)
describe(mydata) 

### Get data----
# Get data: The working directory
getwd()
list.files()
list.files('./data')

setwd('./data')
getwd()
list.files()

setwd('..')
getwd()

# Everything is an object
my_list <- list.files('./data')
my_list
# Get data: Load .csv
?read.csv # QUESTION: What should we write to read the "Alabama.csv" file
read.csv('Alabama.csv') # Not very useful...
read.csv('./data/Alabama.csv') # Not very useful...
df <- read.csv('./data/Alabama.csv') # Check environment window
# QUESTION: What is a data.frame? Other data structure in R?

### Clean data----
# Clean data: Quick look
head(df)
head(df, 10)
summary(df)
str(df)
View(df)
edit(df) # Don't use it!

# Clean data: Remove NAs
complete.cases(df) # logical vector
sum(complete.cases(df))
df <- subset(df, complete.cases(df))

### Transform data----
# Transform data: Wide vs Long
library(reshape2) # QUESTION: How do I install a new package?
head(df)
long <- melt(df, id = "state")
names(long)
names(long) <- c('state', 'prepost', 'score')
head(long)
wide <- dcast(long, row.names(df) + state ~ variable)

### Analyze data----
# Analyze data: summary stats
summary(df)

describe(df)

t.test(df$pre, df$post, paired = TRUE)
results <- t.test(df$pre, df$post, paired = TRUE) # QUESTION: List data structure
str(results)
results$estimate

pvalue <- round(results$p.value, 4)
pvalue_interpretation <- ifelse(pvalue < .05, 'statistically significant', 'not statistically significant')
my_conclusion <- paste('On average, with a p-value of', pvalue, 'the difference between PRE scores and POST scores is', pvalue_interpretation)
# Analyze data: visualize
ggplot(data = long, aes(x = prepost, y = score)) + geom_boxplot()

my_plot <- ggplot(data = long, aes(x = prepost, y = score)) + geom_boxplot()
my_plot

### For loops-----
# For loops: Toy example
for (coin in 1:10) {
  print(paste('I have', coin, 'dollars in my pocket'))
}

# For loop: clean data






