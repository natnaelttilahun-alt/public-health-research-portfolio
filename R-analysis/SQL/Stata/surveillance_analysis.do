****************************************************
* Surveillance Data Analysis (Dummy Dataset)
* Author: Dr. Natnael Tsegaye
****************************************************

clear
set obs 200

gen maternal_age = runiformint(16,45)
gen anc_visits = runiformint(0,6)
gen birth_weight = rnormal(2800,600)
gen perinatal_death = runiform() < 0.1

label define outcome 0 "Alive" 1 "Death"
label values perinatal_death outcome

* Descriptive statistics
summarize maternal_age anc_visits birth_weight
tab perinatal_death

* Logistic regression
logistic perinatal_death maternal_age anc_visits birth_weight

* Export results
estimates store model1
