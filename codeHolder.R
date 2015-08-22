df <- read.csv('Violent_Crime_Rate_California_2006-2010.csv')
library(dplyr)
df <- df[!is.na(df$ratex1000) & df$geotype == 'CO',] # keep only those entries with rates
df <- select(df, reportyear, geoname, county_name, county_fips, region_name, numerator,denominator, ratex1000, LL_95CI, UL_95CI)
