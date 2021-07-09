
import os
import csv
from pathlib import Path 
csvpath = "Resources/budget_data.csv"

with open(csvpath) as csvfile:
  
  csvreader = csv.reader(csvfile, delimiter = ',')
  next(csvreader)
  B_date = []
  profit_Losses =[]
  profit_change = []
  
  for row in csvreader:
   
   B_date.append(row[0])
   profit_Losses.append(int(row[1]))

   for i in range((len(profit_Losses)-1)):
   
     profit_change.append( (profit_Losses[i+1]) - (profit_Losses[i]) )

     Month_count = len(B_date)
     Total_Profit_Losses = sum(profit_Losses)

     High_Profit_Loss = max(profit_change)
     Low_Profit_Loss =  min(profit_change)
   

  
print("Financial Analysis")
print("----------------------------")
print("Total Months:", Month_count)
print(f"Total: ${Total_Profit_Losses}")
print(f"Average Change: ${round(sum(profit_change)/len(profit_change),2)}")
print (f"Greatest Increase in Profits: ${High_Profit_Loss}")
print(f"Greatest Decrease in Profits: $ {Low_Profit_Loss}")

# Output files
output_file = Path("Resources/Budget_Summary.txt")

with open(output_file,"w") as file:
    
# Write methods to print to Financial_Analysis_Summary 
    file.write("Financial Analysis")
    file.write("\n")
    file.write("----------------------------")
    file.write("\n")
    file.write(f"Total Months: {Month_count}")
    file.write("\n")
    file.write(f"Total: ${Total_Profit_Losses}")
    file.write("\n")
    file.write(f"Average Change: {round(sum(profit_change)/len(profit_change),2)}")
    file.write("\n")
    file.write(f"Greatest Increase in Profits: {High_Profit_Loss})")
    file.write("\n")
    file.write(f"Greatest Decrease in Profits: {Low_Profit_Loss})")
