library(NHANES)
library(tidyverse)


#selecting columns
select(NHANES, Age)

select(NHANES, Age, Weight, BMI)

select(NHANES, -HeadCirc)

select(NHANES, starts_with("BP"))

select(NHANES, ends_with("Day"))

select(NHANES, contains("Age"))

#Create smaller NHANES dataset

nhanes_small <-select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, BPDiaAve, Education)


#Renaiming columns
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

nhanes_small

#Renaiming specific columns
nhanes <- rename(nhanes_small, sex =gender)
nhanes_small

#trying out the pipe
colnames(nhanes_small)

nhanes_small %>%
    colnames()

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

nhanes_small %>%
    select(bp_sys_ave, education)

nhanes_small %>%
    rename(bp_sys = bp_sys_ave,
           bp_dia = bp_dia_ave)

nhanes_small %>%
select(bmi, contains("age"))

nhanes_small %>%
blood_pressure <- select (starts_with("bp_"))
rename(blood_pressure, bp_systolic = bp_sys_a

#filtering

nhanes_small %>%
    filter(phys_active != "No")

nhanes_small %>%
    dplyr::select(starts_with("bp_")) %>%
    dplyr::rename(bp_systolic = bp_sys_ave)

#Arrange data
nhanes_small %>%
    arrange(desc(age))

nhanes_small %>%
    arrange(education, age)

# Transform data
nhanes_small %>%
    mutate(age = age * 12, logged_bmi = log(bmi))

nhanes_small %>%
    mutate(old = if_else(age >= 30, "Yes", "No"))

