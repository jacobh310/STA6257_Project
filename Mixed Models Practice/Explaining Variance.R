require(flexplot)
library(lme4)

data(math)

baseline = lmer(MathAch~1 + (1|School), data=math)
ses = lmer(MathAch~SES + (SES|School), data=math)
model.comparison(baseline, ses)

# 5.9% is explained in the residuals