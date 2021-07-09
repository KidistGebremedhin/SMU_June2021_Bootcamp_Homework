
import os
import csv
from pathlib import Path 
csvpath = "Resources/budget_data.csv"

with open(csvpath) as csvfile:
  
  csvreader = csv.reader(csvfile, delimiter = ',')
  Header = next(csvreader)
  
  B_date = []
  chnage_date = []
  profit_Losses =[]
  profit_change = []

  for row in csvreader:
   
   B_date.append(row[0])
   profit_Losses.append(int(row[1]))

   for i in range((len(profit_Losses)-1)):
   
     profit_change.append( profit_Losses[i+1] - profit_Losses[i])
     
     Month_count = len(B_date)
     Total_Profit_Losses = sum(profit_Losses)
     Average_change = round(sum(profit_change)/len(profit_change),2)

     High_Profit_Loss = max(profit_change)
     Low_Profit_Loss =  min(profit_change)

     High_profit_date = profit_change.index(max(profit_change)) + 1
     Low_profit_date = profit_change.index(min(profit_change)) + 1 
     for d in range (len(B_date)):
      chnage_date.append(B_date[d])

print("Financial Analysis")
print("----------------------------")
print("Total Months:", Month_count)
print(f"Total: ${Total_Profit_Losses}")
print(f"Average Change: ${Average_change}")
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
    file.write(f"Average Change: {Average_change}")
    file.write("\n")
    file.write(f"Greatest Increase in Profits: {chnage_date[High_profit_date]} (${(str(High_Profit_Loss))})")
    file.write("\n")
    file.write(f"Greatest Decrease in Profits: {chnage_date[Low_profit_date]} (${(str(Low_Profit_Loss))})")
