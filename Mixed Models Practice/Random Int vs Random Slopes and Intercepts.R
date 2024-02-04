# install.packages("remotes")
# remotes::install_github("dustinfife/flexplot")

require(flexplot)
library(lme4)


data(alcuse)

# Fixed Effects Anova No Predictor
mod = lmer(ALCUSE~ 1 + (1|ID), data=alcuse)
# visualize(mod, plot="model")
summary(mod)

# Random Intercepts Model
rand.intercept = lmer(ALCUSE~1 + AGE_14 + (1|ID), data=alcuse)
summary(rand.intercept)

# Random Intercepts and Random Slopes 
rand.slope.int = lmer(ALCUSE ~ 1 + AGE_14 + (AGE_14|ID), data=alcuse)
summary(rand.slope.int)
visualize(rand.slope.int, plot="model")

