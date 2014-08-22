library(truncnorm)
set.seed(1000)

size <- 1000
# Generate different means for pre / post scores, for each state
mean_pre <- round(rtruncnorm(length(state.name), a = 30, b = 70, mean = 50, sd = 10), 0)
mean_post <- round(rtruncnorm(length(state.name), a = 40, b = 80, mean = 60, sd = 15), 0)
# Generate different number of missing for pre / post scores, for each state
missing_pre <- round(rtruncnorm(length(state.name), a = 20, b = 200, mean = 90, sd = 30), 0)
missing_post <- round(rtruncnorm(length(state.name), a = 80, b = 400, mean = 160, sd = 40), 0)

for (i in seq_along(state.name)) {
# Generate pre / post values for a state
state <- rep(state.name[i], size)
pre <- round(rtruncnorm(size, a = 0, b = 100, mean = mean_pre[i], sd = 15), 0)
post <- round(rtruncnorm(size, a = 0, b = 100, mean = mean_post[i], sd = 15), 0)
# Add missing values
rows_pre <- sample(1:size, size = missing_pre[i])
pre[rows_pre] <- NA
rows_post <- sample(1:size, size = missing_post[i])
post[rows_post] <- NA
# Aggregate values into a single data.frame
df <- data.frame(state = state, pre = pre, post = post)
# save df as a .csv file
write.csv(df, file = paste0('./data/', state[i], '.csv'), row.names = FALSE)
}
