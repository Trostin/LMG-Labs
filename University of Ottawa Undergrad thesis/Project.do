cap log close 
log using Assaigment_1_Y.T.log, replace //log file
//Requires wifi to install this
ssc install outreg2 
ssc install fitstat
ssc install psmatch2
ssc install ivreg2
ssc install kmatch
//ssc install moremata
// Project , Yevgeniy Trostin #8321498, Stata 13 Software
global direc "D:\University\ECO 4186\Trostin_Yevg_NLSY97_replication_code__dataset_and_logfile" // Directory path 
import delimited "D:\University\ECO 4186\Trostin_Yevg_NLSY97_replication_code__dataset_and_logfile\2010_2013.csv"

// code provided by data
label define vlr0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values r0000100 vlr0000100

label define vlr0536300 1 "Male"  2 "Female"  0 "No Information" 
label values r0536300 vlr0536300

label define vlr0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values r0536401 vlr0536401

label define vlr1204500 -999999 "-999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999: 200001+" 
label values r1204500 vlr1204500

label define vlr1235800 1 "Cross-sectional"  0 "Oversample" 
label values r1235800 vlr1235800

label define vlr1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values r1482600 vlr1482600

label define vlt5201400 25 "25"  26 "26"  27 "27"  28 "28"  29 "29"  30 "30"  31 "31" 
label values t5201400 vlt5201400

label define vlt5202300 1 "Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)"  2 "North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)"  3 "South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)"  4 "West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)" 
label values t5202300 vlt5202300

label define vlt5207400 0 "None"  1 "GED"  2 "High school diploma (Regular 12 year program)"  3 "Associate/Junior college (AA)"  4 "Bachelor's degree (BA, BS)"  5 "Master's degree (MA, MS)"  6 "PhD"  7 "Professional degree (DDS, JD, MD)" 
label values t5207400 vlt5207400

label define vlt5211900 0 "Rural"  1 "Urban"  2 "Unknown" 
label values t5211900 vlt5211900

label define vlt5213200 0 "0"  30000 "30000 TO 59999: 300.00-599.99"  60000 "60000 TO 99999: 600.00-999.99"  100000 "100000 TO 149999: 1000.00-1499.99"  150000 "150000 TO 199999: 1500.00-1999.99"  200000 "200000 TO 249999: 2000.00-2499.99"  250000 "250000 TO 299999: 2500.00-2999.99"  300000 "300000 TO 349999: 3000.00-3499.99"  350000 "350000 TO 399999: 3500.00-3999.99"  400000 "400000 TO 449999: 4000.00-4499.99"  450000 "450000 TO 499999: 4500.00-4999.99"  500000 "500000 TO 549999: 5000.00-5499.99"  550000 "550000 TO 599999: 5500.00-5999.99"  600000 "600000 TO 649999: 6000.00-6499.99"  650000 "650000 TO 699999: 6500.00-6999.99"  700000 "700000 TO 749999: 7000.00-7499.99"  750000 "750000 TO 799999: 7500.00-7999.99"  800000 "800000 TO 849999: 8000.00-8499.99"  850000 "850000 TO 9999999: 8500.00+" 
label values t5213200 vlt5213200

label define vlt6055500 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999"  10000 "10000 TO 14999"  15000 "15000 TO 19999"  20000 "20000 TO 24999"  25000 "25000 TO 49999"  50000 "50000 TO 99999999: 50000+" 
label values t6055500 vlt6055500

label define vlt6141700 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7" 
label values t6141700 vlt6141700

label define vlt6141800 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10"  11 "11"  12 "12" 
label values t6141800 vlt6141800

label define vlt6145800 1 "VERY UNDERWEIGHT"  2 "SLIGHTLY UNDERWEIGHT"  3 "ABOUT THE RIGHT WEIGHT"  4 "SLIGHTLY OVERWEIGHT"  5 "VERY OVERWEIGHT" 
label values t6145800 vlt6145800

label define vlt6206400 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values t6206400 vlt6206400

label define vlt6210200 1 "YES"  0 "NO" 
label values t6210200 vlt6210200

label define vlt6216400 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216400 vlt6216400

label define vlt6216401 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216401 vlt6216401

label define vlt6216402 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216402 vlt6216402

label define vlt6216403 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216403 vlt6216403

label define vlt6216500 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216500 vlt6216500

label define vlt6216501 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216501 vlt6216501

label define vlt6216502 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216502 vlt6216502

label define vlt6216503 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values t6216503 vlt6216503

label define vlt6231000 10 "10 TO 430: EXECUTIVE, ADMINISTRATIVE AND MANAGERIAL"  500 "500 TO 950: MANAGEMENT RELATED"  1000 "1000 TO 1240: MATHEMATICAL AND COMPUTER SCIENTISTS"  1300 "1300 TO 1530: ENGINEERS, ARCHITECTS, AND SURVEYORS"  1540 "1540 TO 1560: ENGINEERING AND RELATED TECHNICIANS"  1600 "1600 TO 1760: PHYSICAL SCIENTISTS"  1800 "1800 TO 1860: SOCIAL SCIENTISTS AND RELATED WORKERS"  1900 "1900 TO 1960: LIFE, PHYSICAL, AND SOCIAL SCIENCE TECHNICIANS"  2000 "2000 TO 2060: COUNSELORS, SOCIAL, AND RELIGIOUS WORKERS"  2100 "2100 TO 2150: LAWYERS, JUDGES, AND LEGAL SUPPORT WORKERS"  2200 "2200 TO 2340: TEACHERS"  2400 "2400 TO 2550: EDUCATION, TRAINING, AND LIBRARY WORKERS"  2600 "2600 TO 2760: ENTERTAINERS AND PERFORMERS, SPORTS AND RELATED WORKERS"  2800 "2800 TO 2960: MEDIA AND COMMUNICATION WORKERS"  3000 "3000 TO 3260: HEALTH DIAGNOSIS AND TREATING PRACTITIONERS"  3300 "3300 TO 3650: HEALTH CARE TECHNICAL AND SUPPORT"  3700 "3700 TO 3950: PROTECTIVE SERVICE"  4000 "4000 TO 4160: FOOD PREPARATIONS AND SERVING RELATED"  4200 "4200 TO 4250: CLEANING AND BUILDING SERVICE"  4300 "4300 TO 4430: ENTERTAINMENT ATTENDANTS AND RELATED WORKERS"  4460 "4460: FUNERAL RELATED OCCUPATIONS"  4500 "4500 TO 4650: PERSONAL CARE AND SERVICE WORKERS"  4700 "4700 TO 4960: SALES AND RELATED WORKERS"  5000 "5000 TO 5930: OFFICE AND ADMINISTRATIVE SUPPORT WORKERS"  6000 "6000 TO 6130: FARMING, FISHING, AND FORESTRY"  6200 "6200 TO 6940: CONSTRUCTION TRADES AND EXTRACTION WORKERS"  7000 "7000 TO 7620: INSTALLATION, MAINTENANCE, AND REPAIR WORKERS"  7700 "7700 TO 7750: PRODUCTION AND OPERATING WORKERS"  7800 "7800 TO 7850: FOOD PREPARATION"  7900 "7900 TO 8960: SETTER, OPERATORS, AND TENDERS"  9000 "9000 TO 9750: TRANSPORTATION AND MATERIAL MOVING WORKERS"  9800 "9800 TO 9840: MILITARY SPECIFIC OCCUPATIONS"  9950 "9950 TO 9990: ACS SPECIAL CODES" 
label values t6231000 vlt6231000

label define vlt8123600 28 "28"  29 "29"  30 "30"  31 "31"  32 "32"  33 "33"  34 "34" 
label values t8123600 vlt8123600

label define vlt8123700 1 "Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)"  2 "North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)"  3 "South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)"  4 "West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)" 
label values t8123700 vlt8123700

label define vlt8129600 0 "None"  1 "GED"  2 "High school diploma (Regular 12 year program)"  3 "Associate/Junior college (AA)"  4 "Bachelor's degree (BA, BS)"  5 "Master's degree (MA, MS)"  6 "PhD"  7 "Professional degree (DDS, JD, MD)" 
label values t8129600 vlt8129600

label define vlt8134500 0 "Rural"  1 "Urban"  2 "Unknown" 
label values t8134500 vlt8134500

label define vlt8976700 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999"  10000 "10000 TO 14999"  15000 "15000 TO 19999"  20000 "20000 TO 24999"  25000 "25000 TO 49999"  50000 "50000 TO 99999999: 50000+" 
label values t8976700 vlt8976700

label define vlt9039300 0 "0"  1 "1 TO 24"  25 "25 TO 49"  50 "50 TO 74"  75 "75 TO 99"  100 "100 TO 124"  125 "125 TO 149"  150 "150 TO 174"  175 "175 TO 199"  200 "200 TO 224"  225 "225 TO 249"  250 "250 TO 99999999: 250+" 
label values t9039300 vlt9039300

label define vlt9039400 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9039400 vlt9039400

label define vlt9039500 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9039500 vlt9039500

label define vlt9039600 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9039600 vlt9039600

label define vlt9039700 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9039700 vlt9039700

label define vlt9039800 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9039800 vlt9039800

label define vlt9039900 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9039900 vlt9039900

label define vlt9040000 1 "Very much like me"  2 "Mostly like me"  3 "Somewhat like me"  4 "Not much like me"  5 "Not like me at all" 
label values t9040000 vlt9040000

label define vlt9093100 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values t9093100 vlt9093100

label define vlt9093300 1 "YES"  0 "NO" 
label values t9093300 vlt9093300

label define vlt5915200 0 "Never-married"  1 "Married"  2 "Separated"  3 "Divorced"  4 "Widowed" 
label values t5915200 vlt5915200

label define vlt5206800 0 "None"  1 "1st Grade"  2 "2nd Grade"  3 "3rd Grade"  4 "4th Grade"  5 "5th Grade"  6 "6th Grade"  7 "7th Grade"  8 "8th Grade"  9 "9th Grade"  10 "10th Grade"  11 "11th Grade"  12 "12th Grade"  95 "Ungraded" 
label values t5206800 vlt5206800

label define vlt8128900 0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED" 
label values t8128900 vlt8128900

label define vlt5797300 1 "YES"  0 "NO" 
label values t5797300 vlt5797300

label define vlt5808400 1 "Like it very much"  2 "Like it fairly well"  3 "Think it is OK"  4 "Dislike it somewhat"  5 "Dislike it very much" 
label values t5808400 vlt5808400

label define vlt6316000 1 "YES"  0 "NO" 
label values t6316000 vlt6316000

label define vlt6230100 170 "170 TO 290: AGRICULTURE, FORESTRY AND FISHERIES"  370 "370 TO 490: MINING"  570 "570 TO 690: UTILITIES"  770 "770: CONSTRUCTION"  1070 "1070 TO 3990: MANUFACTURING"  4070 "4070 TO 4590: WHOLESALE TRADE"  4670 "4670 TO 5790: RETAIL TRADE"  5890 "5890: ARTS, ENTERTAINMENT AND RECREATION SERVICES"  6070 "6070 TO 6390: TRANSPORTATION AND WAREHOUSING"  6470 "6470 TO 6780: INFORMATION AND COMMUNICATION"  6870 "6870 TO 7190: FINANCE, INSURANCE, AND REAL ESTATE"  7270 "7270 TO 7790: PROFESSIONAL AND RELATED SERVICES"  7860 "7860 TO 8470: EDUCATIONAL, HEALTH, AND SOCIAL SERVICES"  8560 "8560 TO 8690: ENTERTAINMENT, ACCOMODATIONS, AND FOOD SERVICES"  8770 "8770 TO 9290: OTHER SERVICES"  9370 "9370 TO 9590: PUBLIC ADMINISTRATION"  9670 "9670 TO 9890: ACTIVE DUTY MILITARY"  9950 "9950 TO 9990: ACS SPECIAL CODES" 
label values t6230100 vlt6230100

label define vlr0532200 1 "Yes"  0 "No" 
label values r0532200 vlr0532200

label define vlr1302400 0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED" 
label values r1302400 vlr1302400

label define vlr1302500 0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED" 
label values r1302500 vlr1302500

label define vlr1486500 1 "Uninvolved"  2 "Permissive"  3 "Authoritarian"  4 "Authoritative" 
label values r1486500 vlr1486500

label define vlr1486600 1 "Uninvolved"  2 "Permissive"  3 "Authoritarian"  4 "Authoritative" 
label values r1486600 vlr1486600

label define vlr1486900 0 "0: 0: Not religious"  100 "100 TO 599: 1.00-5.99"  600 "600: 6: Very religious" 
label values r1486900 vlr1486900

label define vlr1487700 0 "0"  1 "1 TO 2"  3 "3 TO 4"  5 "5 TO 6"  7 "7 TO 8"  9 "9 TO 10" 
label values r1487700 vlr1487700

label define vlr1487800 0 "0"  1 "1"  2 "2"  3 "3" 
label values r1487800 vlr1487800

/* Crosswalk for Reference number & Question name + Cleaning data set 
// This portion is provide by data set and modified for clarity
// -1 (refusal), -2 (Don't know), -3 (Invalid Skip), -4 Valid skip, -5 Non-interview
 */
  /* *start* */
  //1997
  rename r0000100 ID_1997 //ID number
  rename r0536300 SEX_1997 //Male or female
  rename r0536401 BDATE_M_1997 //month
  rename r0536402 BDATE_Y_1997 //year
  rename r1204500 Par_GROSS_HH_INCOME_IN_PAST_YEAR //gross hh income from parents
mvdecode Par_GROSS_HH_INCOME_IN_PAST_YEAR  , mv(-4=.\ -3=. \ -2=. \-1=.)
  rename r1235800 SAMPLE_TYPE_1997 //cross section or oversample
  rename r1482600 RACE_ETHNICITY_1997 //race ethnic background
  //2010
  rename t5201400 AGE_2010 //Age
mvdecode AGE_2010  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5202300 CENSUS_REGION_2010 //region
mvdecode CENSUS_REGION_2010 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5207400 HIGHEST_DEGREE_2010 //highest degree earned (dont know what they went to school for)
mvdecode HIGHEST_DEGREE_2010 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5211900 URBAN_RURAL_2010   // URBAN or RURAL
mvdecode URBAN_RURAL_2010 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5213200 SAMPLING_WEIGHT_CC_2010  //sample weight 
  rename t5397100 College_GPA   //college GPA
mvdecode College_GPA  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6055500 Wages_2010   // Total Income from wages --> Wierd maximums did they try categoricals but made them into numerics???
mvdecode Wages_2010 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \130254=.)
  rename t6141700 Height_feet  // Height, feet
mvdecode Height_feet , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6141800 Height_inches   // Height, inches      --> May need need to combine both measurements if need be
mvdecode Height_inches, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6145800 DESCRIBE_WEIGHT   // R DESCRIBE WEIGHT
mvdecode DESCRIBE_WEIGHT , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6206400 GENERAL_HEALTH  // HOW IS R'S GENERAL HEALTH?
mvdecode GENERAL_HEALTH, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6210200 Health_limiting_work   // R LIMITED IN AMOUNT OF WORK BECAUSE OF HEALTH?
mvdecode Health_limiting_work , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216400 PS1_HARD_WORKER   // PERSONALITY SCALE: HARD WORKER
mvdecode PS1_HARD_WORKER  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216401 PS2_Amount_of_work  // PERSONALITY SCALE: AMOUNT OF WORK
mvdecode PS2_Amount_of_work  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216402 PS3_Work_Stand   // PERSONALITY SCALE: WORK STANDARDS
mvdecode PS3_Work_Stand , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216403 PS4_Effort_at_work  // PERSONALITY SCALE: EFFORT AT WORK
mvdecode PS4_Effort_at_work , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216500 PS5_Following_rules   // PERSONALITY SCALE: FOLLOWING RULES
mvdecode PS5_Following_rules  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216501 PS6_Breaking_school_rules   // PERSONALITY SCALE: BREAKING SCHOOL RULES
mvdecode PS6_Breaking_school_rules   , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216502 PS7_Support_rules_trad     // PERSONALITY SCALE: SUPPORT FOR RULES AND TRADITIONS
mvdecode PS7_Support_rules_trad , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6216503 PS8_Bending_rules // PERSONALITY SCALE: BENDING RULES
mvdecode PS8_Bending_rules , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6231000 Occupation_codes   // Most Recent Employee Job, 2002 Codes (industry)
mvdecode Occupation_codes  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5915200 Marital_Status   // Marital Status
mvdecode Marital_Status  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5206800 Education_2010 //Grade in Years
mvdecode Education_2010 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.\95=.)
  rename t5797300 Union_member   // does respondent have a Union membership
mvdecode Union_member, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t5808400 Job_satisfaction   // How satisfied are you with your job?
mvdecode Job_satisfaction, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6316000 TRAINING_Program   // TRAINING
mvdecode TRAINING_Program, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t6230100 Industry_2010   // Industry
mvdecode Industry_2010, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
   
  //2013
  rename t8123600 AGE_2013 //interview date
mvdecode AGE_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t8123700 CENSUS_REGION_2013 //region
mvdecode CENSUS_REGION_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t8129600 HIGHEST_DEGREE_2013 //highest degree earned
mvdecode HIGHEST_DEGREE_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t8134500 URBAN_RURAL_2013   // CV_URBAN-RURAL
mvdecode URBAN_RURAL_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t8976700 wages_2013   // TOTAL INCOME FROM WAGES AND SALARY IN PAST YEAR
mvdecode wages_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.\180331=.)
  rename t9039300 weight_pounds_2013   // R'S WEIGHT - POUNDS
mvdecode weight_pounds_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9039400 GRIT_1_distracted_2013   // GRIT SCALE: NEW IDEAS DISTRACT FROM OLD ONES
mvdecode GRIT_1_distracted_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9039500 GRIT_2_not_discouraged_2013   // GRIT SCALE: SETBACKS DO NOT DISCOURAGE
mvdecode GRIT_2_not_discouraged_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9039600 GRIT_3_obsessions_2013    // GRIT SCALE: SHORT TERM OBSESSIONS
mvdecode GRIT_3_obsessions_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9039700 GRIT_4_Hard_worker_2013   // GRIT SCALE: HARD WORKER
mvdecode GRIT_4_Hard_worker_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9039800 GRIT_5_f_goal_change_2013   // GRIT SCALE: CHANGE GOALS FREQUENTLY
mvdecode GRIT_5_f_goal_change_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9039900 GRIT_6_Focus_2013   // GRIT SCALE: MAINTAINING FOCUS
mvdecode GRIT_6_Focus_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9040000 GRIT_7_project_completion_2013   // GRIT SCALE: ABILITY TO FINISH PROJECTS
mvdecode GRIT_7_project_completion_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9093100 General_health_2013   // HOW IS R'S GENERAL HEALTH?
mvdecode General_health_2013  , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t9093300 health_limiting_work_2013   // R LIMITED IN AMOUNT OF WORK BECAUSE OF HEALTH?
mvdecode health_limiting_work_2013 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename u0203700 college_gpa_2015   //college GPA
mvdecode college_gpa_2015 , mv(-5=.\ -4=.\ -3=. \ -2=. \-1=.)
  rename t8128900 Education_2013  // Grade in Years
mvdecode Education_2013, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  // No data for tenure 
recode SEX_1997 (1=0) (2=1), gen (R_Sex)
label variable R_Sex "Female=1, Male=0"

//parental data
  rename r0532200 L_W_B_P   // Living with biological parents
mvdecode L_W_B_P, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1302400 HGC_BIO_DAD_1997     // Highest grade achieved by father
mvdecode HGC_BIO_DAD_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1302500 HGC_BIO_MOM_1997     // Highest grade achieved by mother
mvdecode HGC_BIO_MOM_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1486500 FP_YMPSTYL_1997         // Mother's parenting style
mvdecode FP_YMPSTYL_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1486600 FP_YFPSTYL_1997         // Father's parenting style
mvdecode FP_YFPSTYL_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1486900 RELIG_1997         // Religion scale
mvdecode RELIG_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1487700 CRIMI_1997         // Child's delinquency index
mvdecode CRIMI_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)
  rename r1487800 SUBSI_1997         // Substance use index
mvdecode SUBSI_1997, mv(-5=.\ -4=.\ -3=. \ -2=. \-1=. \95=.)

  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
//Extra cleaning for unknown
recode URBAN_RURAL_2010 (0=0) (1=1)(2=.), gen (Urban_2010)
recode URBAN_RURAL_2013(0=0) (1=1) (2=.), gen (Urban_2013)
//Categoricacl variables 
gen parents_income_class = .
replace parents_income_class = 1 if Par_GROSS_HH_INCOME_IN_PAST_YEAR <=31000
replace parents_income_class = 2 if Par_GROSS_HH_INCOME_IN_PAST_YEAR >= 31000 & Par_GROSS_HH_INCOME_IN_PAST_YEAR < 42000
replace parents_income_class = 3 if Par_GROSS_HH_INCOME_IN_PAST_YEAR >= 42000 & Par_GROSS_HH_INCOME_IN_PAST_YEAR < 126000
replace parents_income_class = 4 if Par_GROSS_HH_INCOME_IN_PAST_YEAR >= 126000 & Par_GROSS_HH_INCOME_IN_PAST_YEAR < 188000
replace parents_income_class = 5 if Par_GROSS_HH_INCOME_IN_PAST_YEAR >= 188000 & Par_GROSS_HH_INCOME_IN_PAST_YEAR < 100000000
//change occupation code categorical
//Add names to categories <--##REEE##
recode Occupation_codes (1/430=1) (500/950=2) (1000/1240=3) (1300/1530=4)(1540/1560=5)(1600/1760=6)(1800/1860=7)(1900/1960=8)(2000/2060=9)(2100/2150=10)(2200/2340=11) (2400/2550=12) (2600/2760=13) (2800/2960=14) (3000/3260=15) (3300/3650=16)(3700/3950=17)(4000/4160=18)(4200/4250=19) (4300/4430=20) (4460=21) (4500/4650=22) (4700/4960=23) (5000/5930=24) (6000/6130=25) (6200/6940=26) (7000/7620=27) (7700/7750=28) (7800/7850=29) (7900/8960=30) (9000/9750 = 31) (9800/9840 = 32) (9950/9990 = 33) , gen (Occupation_Category)
recode Industry_2010 (1/290=1) (370/490=2) (570/690=3) (770/1000=4)(1070/3990=5)(4070/4590=6)(4670/5790=7)(5890=8)(6070/6390=9)(6470/6780=10)(6870/7190=11) (7270/7790=12) (7860/8470=13) (8560/8690=14) (8770/9290=15) (9370/9590=16)(9670/9890=17)(9950/9990=18), gen (Industry_Category)
//Removing non standart (0-4 scale gpa's scores)
gen gpa_2010= College_GPA/100
sort gpa_2010
replace gpa_2010 = . in 713/720
gen gpa_2013 = college_gpa_2015/100
sort gpa_2013
replace gpa_2013 = . in 458/464

//Descriptives
//graph pie, over(SEX_1997)
//graph pie, over(RACE_ETHNICITY_1997)
//graph pie, over(AGE_2010) above three are representative of sample 
// Below are using weights which discount or inflate sample in accordance to US population data
//remove comments to add pause
//more
graph pie [pweight = SAMPLING_WEIGHT_CC_2010], over(RACE_ETHNICITY_1997)
//more
graph pie [pweight = SAMPLING_WEIGHT_CC_2010], over(AGE_2010) 
//more
graph pie [pweight = SAMPLING_WEIGHT_CC_2010], over(HIGHEST_DEGREE_2010)
//more
graph hbox Par_GROSS_HH_INCOME_IN_PAST_YEAR
//more
graph hbox gpa_2010
//more
sum
//Tabulate data
tab R_Sex
tab URBAN_RURAL_2010
tab Union_member
tab Education_2010
tab Marital_Status
tab GENERAL_HEALTH
tab CENSUS_REGION_2010
tab AGE_2010
tab parents_income_class
tab HIGHEST_DEGREE_2010
tab RACE_ETHNICITY_1997

//Generating
gen log_wage_2010 = log( Wages_2010 )
gen log_wage_2013 = log( wages_2013 )
gen Training_squared = TRAINING_Program * TRAINING_Program

//Graphs
//normal
twoway (scatter  log_wage_2010 HIGHEST_DEGREE_2010, mcolor(blue) msymbol(o) ) (lfit  log_wage_2010 HIGHEST_DEGREE_2010 )
//log
twoway (scatter  Wages_2010 HIGHEST_DEGREE_2010, mcolor(blue) msymbol(o) ) (lfit  Wages_2010 HIGHEST_DEGREE_2010 )
//log by gender
twoway (scatter log_wage_2010 HIGHEST_DEGREE_2010 if R_Sex ==0, mcolor(blue) msymbol(o) ) (lfit log_wage_2010 HIGHEST_DEGREE_2010 if R_Sex ==0) (scatter log_wage_2010 HIGHEST_DEGREE_2010 if R_Sex==1, mcolor(red) msymbol(o)) (lfit log_wage_2010 HIGHEST_DEGREE_2010 if R_Sex==1)
//Population pyramid
/*
gen f_age = AGE_2010 if R_Sex==1
gen m_age = AGE_2010 if R_Sex==0
replace m_age = -m_age
#delimit ;
twoway bar m_age AGE_2010, horizontal ||
bar f_age AGE_2010, horizontal
title("Male and Female by Age, Year 2010")
note("note", span);
#delimit cr
*/
//gen f_wage = Wages_2010 if R_Sex==1
//gen m_wage = Wages_2010 if R_Sex==0
//replace m_wage = -m_wage
//#delimit ;
//twoway bar m_wage HIGHEST_DEGREE_2010, horizontal ||
//bar f_wage HIGHEST_DEGREE_2010, horizontal
//title("title")
//note("note7", span);
//dont forget to name these
//re runs these so you can add better titles
twoway (scatter log_wage_2010 AGE_2010 if parents_income_class ==1, mcolor(blue) msymbol(.) ) (lfit log_wage_2010 AGE_2010 if parents_income_class  ==1) (scatter log_wage_2010 AGE_2010 if parents_income_class ==2, mcolor(red) msymbol(.)) (lfit log_wage_2010 AGE_2010 if parents_income_class ==2) (scatter log_wage_2010 AGE_2010 if parents_income_class ==3, mcolor(yellow) msymbol(.) ) (lfit log_wage_2010 AGE_2010 if parents_income_class  ==3) (scatter log_wage_2010 AGE_2010 if parents_income_class ==4, mcolor(lavender) msymbol(.)) (lfit log_wage_2010 AGE_2010 if parents_income_class ==4) (scatter log_wage_2010 AGE_2010 if parents_income_class ==5, mcolor(brown) msymbol(.) ) (lfit log_wage_2010 AGE_2010 if parents_income_class  ==5)
twoway (scatter log_wage_2010 AGE_2010 if parents_income_class ==1, mcolor(blue) msymbol(i) ) (lfit log_wage_2010 AGE_2010 if parents_income_class  ==1) (scatter log_wage_2010 AGE_2010 if parents_income_class ==2, mcolor(red) msymbol(i)) (lfit log_wage_2010 AGE_2010 if parents_income_class ==2) (scatter log_wage_2010 AGE_2010 if parents_income_class ==3, mcolor(yellow) msymbol(i) ) (lfit log_wage_2010 AGE_2010 if parents_income_class  ==3) (scatter log_wage_2010 AGE_2010 if parents_income_class ==4, mcolor(lavender) msymbol(i)) (lfit log_wage_2010 AGE_2010 if parents_income_class ==4) (scatter log_wage_2010 AGE_2010 if parents_income_class ==5, mcolor(brown) msymbol(i) ) (lfit log_wage_2010 AGE_2010 if parents_income_class  ==5)
twoway (scatter Wages_2010 Education_2010)
twoway (scatter Wages_2010 AGE_2010 if parents_income_class ==1, mcolor(blue) msymbol(i) ) (lfit Wages_2010 AGE_2010 if parents_income_class  ==1) (scatter Wages_2010 AGE_2010 if parents_income_class ==2, mcolor(red) msymbol(i)) (lfit Wages_2010 AGE_2010 if parents_income_class==2) (scatter Wages_2010 AGE_2010 if parents_income_class ==3, mcolor(yellow) msymbol(i) ) (lfit Wages_2010 AGE_2010 if parents_income_class  ==3) (scatter Wages_2010 AGE_2010 if parents_income_class ==4, mcolor(lavender) msymbol(i)) (lfit Wages_2010 AGE_2010 if parents_income_class ==4) (scatter Wages_2010 AGE_2010 if parents_income_class ==5, mcolor(brown) msymbol(i) ) (lfit Wages_2010 AGE_2010 if parents_income_class  ==5)
twoway (scatter Wages_2010 AGE_2010 if parents_income_class ==1, mcolor(blue) msymbol(.) ) (lfit Wages_2010 AGE_2010 if parents_income_class  ==1) (scatter Wages_2010 AGE_2010 if parents_income_class ==2, mcolor(red) msymbol(.)) (lfit Wages_2010 AGE_2010 if parents_income_class==2) (scatter Wages_2010 AGE_2010 if parents_income_class ==3, mcolor(yellow) msymbol(.) ) (lfit Wages_2010 AGE_2010 if parents_income_class  ==3) (scatter Wages_2010 AGE_2010 if parents_income_class ==4, mcolor(lavender) msymbol(.)) (lfit Wages_2010 AGE_2010 if parents_income_class ==4) (scatter Wages_2010 AGE_2010 if parents_income_class ==5, mcolor(brown) msymbol(.) ) (lfit Wages_2010 AGE_2010 if parents_income_class  ==5)
twoway (scatter wages_2013 AGE_2013 if parents_income_class ==1, mcolor(blue) msymbol(.) ) (lfit wages_2013 AGE_2013 if parents_income_class  ==1) (scatter wages_2013 AGE_2013 if parents_income_class ==2, mcolor(red) msymbol(.)) (lfit wages_2013 AGE_2013 if parents_income_class==2) (scatter wages_2013 AGE_2013 if parents_income_class ==3, mcolor(yellow) msymbol(.) ) (lfit wages_2013 AGE_2013 if parents_income_class  ==3) (scatter wages_2013 AGE_2013 if parents_income_class ==4, mcolor(lavender) msymbol(.)) (lfit wages_2013 AGE_2013 if parents_income_class ==4) (scatter wages_2013 AGE_2013 if parents_income_class ==5, mcolor(brown) msymbol(.) ) (lfit wages_2013 AGE_2013 if parents_income_class  ==5)
twoway (scatter wages_2013 AGE_2013 if parents_income_class ==1, mcolor(blue) msymbol(i) ) (lfit wages_2013 AGE_2013 if parents_income_class  ==1) (scatter wages_2013 AGE_2013 if parents_income_class ==2, mcolor(red) msymbol(i)) (lfit wages_2013 AGE_2013 if parents_income_class==2) (scatter wages_2013 AGE_2013 if parents_income_class ==3, mcolor(yellow) msymbol(i) ) (lfit wages_2013 AGE_2013 if parents_income_class  ==3) (scatter wages_2013 AGE_2013 if parents_income_class ==4, mcolor(lavender) msymbol(i)) (lfit wages_2013 AGE_2013 if parents_income_class ==4) (scatter wages_2013 AGE_2013 if parents_income_class ==5, mcolor(brown) msymbol(i) ) (lfit wages_2013 AGE_2013 if parents_income_class  ==5)
twoway (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==1, mcolor(blue) msymbol(i) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class  ==1) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==2, mcolor(red) msymbol(i)) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class==2) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==3, mcolor(yellow) msymbol(i) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class  ==3) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==4, mcolor(lavender) msymbol(i)) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==4) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==5, mcolor(brown) msymbol(i) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class  ==5)
twoway (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==1, mcolor(blue) msymbol(.) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class  ==1) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==2, mcolor(red) msymbol(.)) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class==2) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==3, mcolor(yellow) msymbol(.) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class  ==3) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==4, mcolor(lavender) msymbol(.)) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==4) (scatter Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class ==5, mcolor(brown) msymbol(.) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if parents_income_class  ==5)
//twoway (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==0, mcolor(blue) msymbol(i) ) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010  ==0) (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==1, mcolor(red) msymbol(i)) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==1) (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==2, mcolor(yellow) msymbol(i) ) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010  ==2) (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==3, mcolor(lavender) msymbol(i)) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==3) (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==4, mcolor(brown) msymbol(i) ) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010  ==4)(scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==5, mcolor(lavender) msymbol(i)) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==5) (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==6, mcolor(brown) msymbol(i) ) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010  ==6) (scatter Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==7, mcolor(lavender) msymbol(i)) (lfit Wages_2010 parents_income_class if HIGHEST_DEGREE_2010 ==7)
//Run regresions
reg Wages_2010 HIGHEST_DEGREE_2010 [pweight = SAMPLING_WEIGHT_CC_2010] , robust
outreg2 using "$direc\8321498_Trostin_A1.xml", replace ctitle(reg1) label // output
//reg log_wage_2010 HIGHEST_DEGREE_2010 [pweight = SAMPLING_WEIGHT_CC_2010] , robust
//outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg2) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010 parents_income_class [pweight = SAMPLING_WEIGHT_CC_2010] , robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg2) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010 parents_income_class R_Sex [pweight = SAMPLING_WEIGHT_CC_2010] , robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg3) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010 parents_income_class RACE_ETHNICITY_1997 [pweight = SAMPLING_WEIGHT_CC_2010] , robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg4) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 [pweight = SAMPLING_WEIGHT_CC_2010] , robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg5) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status [pweight = SAMPLING_WEIGHT_CC_2010], robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg6) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status Union_member TRAINING_Program [pweight = SAMPLING_WEIGHT_CC_2010], robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg7) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010#HIGHEST_DEGREE_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status Union_member TRAINING_Program [pweight = SAMPLING_WEIGHT_CC_2010], robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg8) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010#HIGHEST_DEGREE_2010#HIGHEST_DEGREE_2010 parents_income_class# parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status Union_member TRAINING_Program [pweight = SAMPLING_WEIGHT_CC_2010], robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg9) label  //appendetement to output
reg Wages_2010 HIGHEST_DEGREE_2010#HIGHEST_DEGREE_2010#HIGHEST_DEGREE_2010 parents_income_class# parents_income_class RACE_ETHNICITY_1997# RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status#Marital_Status Union_member TRAINING_Program [pweight = SAMPLING_WEIGHT_CC_2010], robust
outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg10) label  //appendetement to output

//matching
//mlogit  HIGHEST_DEGREE_2010 Wages_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status Union_member TRAINING_Program PS1_HARD_WORKER PS2_Amount_of_work PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules Occupation_Category Industry_Category
mlogit  HIGHEST_DEGREE_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010
//kmatch ps Union_member HIGHEST_DEGREE_2010 TRAINING_Program Industry_Category RACE_ETHNICITY_1997  ( Wages_2010 ), nate att
//kmatch density, lw(*6 *2) lc(*.5 *1)
//kmatch ps Union_member parents_income_class TRAINING_Program Industry_Category RACE_ETHNICITY_1997  ( HIGHEST_DEGREE_2010 ), nate att
//kmatch ps Union_member parents_income_class TRAINING_Program Industry_Category RACE_ETHNICITY_1997 PS1_HARD_WORKER PS2_Amount_of_work PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules  ( HIGHEST_DEGREE_2010 Wages_2010 ), nate att
kmatch md Union_member Industry_Category RACE_ETHNICITY_1997 R_Sex  ( Wages_2010 ), att vce(boot) over( parents_income_class )
gen BA= HIGHEST_DEGREE_2010==4
kmatch md Union_member BA Industry_Category RACE_ETHNICITY_1997 R_Sex  ( Wages_2010 ), att vce(boot) over( parents_income_class )
kmatch ps Union_member BA Industry_Category RACE_ETHNICITY_1997 R_Sex  ( Wages_2010 ), att vce(boot) over( parents_income_class )
kmatch density, lw(*6 *2) lc(*.5 *1)
kmatch cumul, lw(*6 *2) lc(*.5 *1)
kmatch ps BA Industry_Category RACE_ETHNICITY_1997 R_Sex parents_income_class URBAN_RURAL_2010 GENERAL_HEALTH ( Wages_2010 ), att vce(boot)over( parents_income_class )
kmatch ps BA Industry_Category RACE_ETHNICITY_1997 AGE_2010 parents_income_class URBAN_RURAL_2010 GENERAL_HEALTH PS1_HARD_WORKER PS2_Amount_of_work PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules ( Wages_2010  ), att vce(boot)over( SEX_1997 )
kmatch density, lw(*6 *2) lc(*.5 *1)
kmatch cumul, lw(*6 *2) lc(*.5 *1)
// dumbass match on education right now its people who have bachelors and dont have bachelors
//kmatch md BA Industry_Category RACE_ETHNICITY_1997 AGE_2010 parents_income_class URBAN_RURAL_2010 GENERAL_HEALTH PS1_HARD_WORKER PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules ( Wages_2010 ), att nn
//kmatch md  Union_member  Marital_Status HIGHEST_DEGREE_2010 Industry_Category RACE_ETHNICITY_1997  TRAINING_Program  Job_satisfaction AGE_2010 parents_income_class URBAN_RURAL_2010 GENERAL_HEALTH PS1_HARD_WORKER PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules ( Wages_2010 ), att nn
//teffects nnmatch ( Wages_2010 Marital_Status HIGHEST_DEGREE_2010 Industry_Category RACE_ETHNICITY_1997  TRAINING_Program  Job_satisfaction AGE_2010 parents_income_class URBAN_RURAL_2010 GENERAL_HEALTH PS1_HARD_WORKER PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules) ( Union_member ), atet
logit  Union_member HIGHEST_DEGREE_2010 Wages_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status TRAINING_Program PS1_HARD_WORKER PS2_Amount_of_work PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules Occupation_Category Industry_Category
predict p2score
psmatch2 Union_member , outcome ( Wages_2010 ) pscore (p2score) neighbor (1) common noreplacement
twoway (scatter Wages_2010 HIGHEST_DEGREE_2010 if _nn ==1, mcolor(blue) msymbol(o) ) (lfit Wages_2010 HIGHEST_DEGREE_2010  if _nn ==1) (scatter Wages_2010 HIGHEST_DEGREE_2010  if _nn ==0, mcolor(blue) msymbol(o) ) (lfit Wages_2010 HIGHEST_DEGREE_2010  if _nn ==0)
//reg Wages_2010 HIGHEST_DEGREE_2010#HIGHEST_DEGREE_2010 parents_income_class# parents_income_class Marital_Status# Marital_Status RACE_ETHNICITY_1997#RACE_ETHNICITY_1997 SEX_1997 URBAN_RURAL_2010 SEX_1997 CENSUS_REGION_2010  Union_member TRAINING_Program Occupation_Category Industry_Category[pweight = SAMPLING_WEIGHT_CC_2010], robust
//outreg2 using "$direc\8321498_Trostin_A1.xml", append ctitle(reg11) label  //appendetement to output
logit  R_Sex HIGHEST_DEGREE_2010 Wages_2010 parents_income_class RACE_ETHNICITY_1997 CENSUS_REGION_2010 Marital_Status TRAINING_Program PS1_HARD_WORKER PS2_Amount_of_work PS3_Work_Stand PS4_Effort_at_work PS5_Following_rules PS6_Breaking_school_rules PS7_Support_rules_trad PS8_Bending_rules Occupation_Category Industry_Category
predict p3score
psmatch2 R_Sex , outcome ( Wages_2010 ) pscore (p3score) neighbor (1) common noreplacement
twoway (scatter Wages_2010 HIGHEST_DEGREE_2010 if _nn ==1, mcolor(blue) msymbol(o) ) (lfit Wages_2010 HIGHEST_DEGREE_2010  if _nn ==1) (scatter Wages_2010 HIGHEST_DEGREE_2010  if _nn ==0, mcolor(red) msymbol(o) ) (lfit Wages_2010 HIGHEST_DEGREE_2010  if _nn ==0)
reg Wages_2010 HIGHEST_DEGREE_2010 if _support ==1 &_weight ==1, robust
outreg2 using "$direc\8321498_Trostin_A2.xml", replace ctitle(reg1) label // output
reg Wages_2010 HIGHEST_DEGREE_2010 Urban_2010 TRAINING_Program RACE_ETHNICITY_1997 Union_member parents_income_class if _support ==1 &_weight ==1, robust
outreg2 using "$direc\8321498_Trostin_A2.xml", append ctitle(reg2) label  //appendetement to output
kmatch md R_Sex Union_member Industry_Category RACE_ETHNICITY_1997 R_Sex  ( Wages_2010 ), att vce(boot) over( HIGHEST_DEGREE_2010 )
twoway (scatter Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997 ==1, mcolor(blue) msymbol(.) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997  ==1) (scatter Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997 ==2, mcolor(red) msymbol(.)) (lfit Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997==2) (scatter Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997 ==3, mcolor(yellow) msymbol(.) ) (lfit Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997  ==3) (scatter Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997 ==4, mcolor(navy%30) msymbol(i)) (lfit Wages_2010 HIGHEST_DEGREE_2010 if RACE_ETHNICITY_1997 ==4)

