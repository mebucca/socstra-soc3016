library(tidyverse)
y_p <- runif(10000,100,12000)

alpha = 0 

beta = 0.7 

e = rnorm(10000, mean = 0, sd = 0.3)

log_yh <- alpha + beta* log(y_p) + e 


y_h <- exp(log_yh)

tibble(log_yh, y_p) %>% 
  ggplot(aes(x = log(y_p), y = log_yh)) +
  geom_point(alpha=0.1) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "log(ingresos padres(", y = "log(ingresos hijos") +
  theme_minimal()

model <- lm(log_yh ~ log(y_p))
summary(model)
