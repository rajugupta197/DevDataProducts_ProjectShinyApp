---
title: "Coursera - Developing Data Products - Course Project"
author: "Raju Gupta"
date: "November 26, 2017"
output:
  html_document:
    keep_md: yes
  pdf_document: default
---

# Developing Data Products - Course Project
=========================
This is a submission for Coursera: Developing Data Products- Course Project

## Inpatient Prospective Payment System
==================

The dataset is a subset of a United States medical expenditures dataset with information on costs for different medical conditions and in different areas of the country.

I have made multiple plots that answers the question: how does the relationship between mean covered charges (Average.Covered.Charges) and mean total payments (Average.Total.Payments) vary by medical condition (DRG.Definition) and the state in which care was received (Provider.State)

Dataset has been obtained from [website](https://data.cms.gov/Medicare/Inpatient-Prospective-Payment-System-IPPS-Provider/97k6-zzx3) and processed for the course project. 

The data provided here include hospital-specific charges for the more than 3,000 U.S. hospitals that receive Medicare Inpatient Prospective Payment System (IPPS) payments for the top 100 most frequently billed discharges, paid under Medicare based on a rate per discharge using the Medicare Severity Diagnosis Related Group (MS-DRG) for Fiscal Year 2011.

Source code for the project is available on the [GitHub](https://github.com/rajugupta197/DevDataProducts_ProjectShinyApp).

The presentation for the project can be found [here](http://rpubs.com/rgupta197/DevDataProductsPPT)

### Instructions
=====================
#### View Data Analysis charts
User can view the various charts showing relationship between mean covered charges and mean total payments for each available U.S. state separately. Each plot is coloured to show individual Diagnosis-Related Groups information (also defined in legend on main panel). Current dataset contains data of 6 states with total 6401 rows.

#### Show/Hide Linear Models
User can choose among the 6 available linear models of Diagnosis-Related Groups information to be displayed/hide in the plots. This choice can be done by selecting the checkboxes available on the upper left penal of the landing page.

#### Show/Hide U.S. State Plots
User can also show hide the each state's plot from the lower left penal.

#### View and Download Dataset
In order to view or download the dataset, user can do so by clicking on the *data* tab on the top of the page. Data can be filtered out by selecting any combination of checkboxes on the left penal.

