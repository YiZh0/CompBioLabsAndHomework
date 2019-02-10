# create a new .csv file with 11 lines of data total (header row and last 10 rows) and three columns total (2-4) from PredPreyData.csv

# keep columns 2-4 of the comma-delimited file PredPreyData.csv and (use pipe) save the header row to PredPreyData_newdata.csv
cut -f 2-4 -d , PredPreyData.csv | head -n 1 > PredPreyData_newdata.csv
# keep columns 2-4 of the comma-delimited file PredPreyData.csv and (use pipe) save the last 10 lines of data to PredPreyData_newdata.csv
cut -f 2-4 -d , PredPreyData.csv | tail -10 >> PredPreyData_newdata.csv
