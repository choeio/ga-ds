#load data
e = read.csv("~/ga/final/edu_exp_ga.csv", header = TRUE, sep = ",", dec = ".", )

#first filter to get rid of useless data
e2 <- subset(e, career_field!=0 & exp_level!=0)

#Relabel x values
estat <- with(e2, exp_level)
estat[estat == "Executive"] <- "5 Exec"
estat[estat == "Experienced (Non-Managerial)"] <- "3 Expr"
estat[estat == "Student"] <- "1 Stud"
estat[estat == "Entry Level"] <- "2 Entr"
estat[estat == "Manager"] <- "4 Mngr"
e3 <- within(e2, levels(exp_level) <- estat)

#put it all in order
e3$exp_level <- as.character(e3$exp_level)
e3$exp_level <- factor(e3$exp_level, levels=c("1 Stud", "2 Entr", "3 Expr", "4 Mngr", "5 Exec"), ordered=TRUE)

#plot
ggplot(e3, aes(x=exp_level), group=career_field) + geom_histogram(aes(y=..count../sum(..count..))) + facet_wrap(~ career_field) + opts(legend.position = "top")

#why does this not work? trying to get relative percentages within a facet
# ggplot(e3, aes(x=exp_level), group=career_field) + geom_bar(aes(y=..density..)) + facet_wrap(~ career_field) + scale_y_continuous(labels = percent_format())

#can't figure it out!
#attach(e2)
#e2$exp_cat[exp_level = "Executive"] <- "5 Exec"
#e2$exp_cat[exp_level = "Experienced (Non-Managerial)"] <- "3 Expr"
#e2$exp_cat[exp_level = "Student"] <- "1 Stud"
#e2$exp_cat[exp_level = "Entry Level"] <- "2 Entr"
#e2$exp_cat[exp_level = "Manager"] <- "4 Mngr"
#detach(e2)

#this isn't working either
#e2$exp_cat <- as.character(e2$exp_level)
#e2$exp_cat[exp_cat == "Executive"] <- "5 Exec"
#e2$exp_cat[exp_cat == "Experienced (Non-Managerial)"] <- "3 Expr"
#e2$exp_cat[exp_cat == "Student"] <- "1 Stud"
#e2$exp_cat[exp_cat == "Entry Level"] <- "2 Entr"
#e2$exp_cat[exp_cat == "Manager"] <- "4 Mngr"

#elif format? not working either!
#category <- (if(exp_level = "Executive") {"5 Exec"}
#else if (exp_level = "Experienced (Non-Managerial)" {"3 Expr"}
#else if (exp_level = "Student") {"1 Stud"}
#else if (exp_level = "Entry Level") {"2 Entr"}
#else if (exp_level = "Manager") {"4 Mngr"}
#else {})



