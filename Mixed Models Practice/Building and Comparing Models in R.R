require(flexplot)
library(lme4)


# Step 1: Fit a baseline model
data(math)
baseline = lmer(MathAch~1 + (1|School), data=math)

# Step 2: Compute ICC
icc(baseline)
# 18% percent of variability can be explained by clustering

visualize(baseline, plot='model')

# Step 3: Fit a reduced model:
# Research question: do we need to have SES (socioeconomic status have a random slope)
fixed_slopes = lmer(MathAch~SES + (1|School), data=math)
random_slopes = lmer(MathAch~SES + (SES|School), data=math)

# Step 4 Visualize the model
visualize(random_slopes, plot='model')

compare.fits(MathAch~SES | School, data=math, fixed_slopes, random_slopes, clusters=10)

# Step 5: Do a model comparison
model.comparison(fixed_slopes, baseline)
model.comparison(random_slopes, baseline)
model.comparison(fixed_slopes ,random_slopes)
