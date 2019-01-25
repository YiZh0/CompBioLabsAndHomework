cut -f 2-4 -d , PredPreyData.csv | head -n 1 > PredPreyData_newdata.csv
cut -f 2-4 -d , PredPreyData.csv | tail -10 >> PredPreyData_newdata.csv
