library(ggplot2)
if (length(commandArgs(trailingOnly= TRUE))<1){
    stop("Usage: Rscript LRM-R.R <csv_file>")
}

csv_file <- commandArgs(trailingOnly = TRUE)[1]

data <- read.csv(csv_file)

png(file = "r_orig.png")
ggplot(data , aes(x = x , y = y)) + geom_point()

model = lm(formula = y ~ x,
           data = data)
sum_stats = summary(model)
sum_stats$r.squared
coef(model)[1]
coef(model)[2]
png(file = "r_lm.png")
ggplot() + 
geom_line(aes(x = data$x, y = predict(model, newdata = data)), colour = 'green')

ggplot() + 
geom_point(aes(x = data$x, y = data$y),
           colour = 'yellow') + 
geom_line(aes(x = data$x, y = predict(model, newdata = data)),
          colour = 'purple')




