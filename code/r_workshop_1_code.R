### Set-up default options
options(stringsAsFactors = FALSE)

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


### Transform data---- JUST DEMONSTRATE
# Transform data: Wide vs Long
library(reshape2) # QUESTION: How do I install a new package?
head(df)
long <- melt(df, id = "state")
head(long)
wide <- dcast(long, row.names(df) + state ~ variable)

### Analyze data---
# Analyze data: summary stats

# Analyze data: visualize

analyze_data_files







