# ----------------------------------------
# Perinatal Mortality Analysis (Dummy Data)
# Author: Dr. Natnael Tsegaye
# Purpose: Demonstrate quantitative analysis
# ----------------------------------------

set.seed(123)

# Simulated dataset
data <- data.frame(
  gestational_age = sample(28:42, 200, replace = TRUE),
  birth_weight = rnorm(200, mean = 2800, sd = 600),
  maternal_age = sample(16:45, 200, replace = TRUE),
  antenatal_visits = sample(0:6, 200, replace = TRUE),
  outcome = sample(c(0,1), 200, replace = TRUE, prob = c(0.9, 0.1))
)

# Outcome: 1 = perinatal death, 0 = alive

# Descriptive statistics
summary(data)

# Logistic regression
model <- glm(outcome ~ gestational_age + birth_weight +
               maternal_age + antenatal_visits,
             data = data,
             family = binomial)

summary(model)

# Odds ratios
exp(cbind(OR = coef(model), confint(model)))
