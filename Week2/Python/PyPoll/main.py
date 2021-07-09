import os, csv
from pathlib import Path 


csvpath = "Resources/election_data.csv"

vote_count = 0 
khans_votes = 0
correys_votes = 0
lis_votes = 0
otooleys_votes = 0

with open(csvpath) as csvfile:

    csvreader = csv.reader(csvfile,delimiter=",") 
    next(csvreader)     

    for row in csvreader: 

        vote_count +=1

        if row[2] == "Khan": 
            khans_votes +=1
        elif row[2] == "Correy":
            correys_votes +=1
        elif row[2] == "Li": 
            lis_votes +=1
        elif row[2] == "O'Tooley":
            otooleys_votes +=1

candidates = ["Khan", "Correy", "Li","O'Tooley"]
votes = [khans_votes, correys_votes,lis_votes,otooleys_votes]


dict_candidates_and_votes = dict(zip(candidates,votes))
key = max(dict_candidates_and_votes, key=dict_candidates_and_votes.get)


khan_percent = (khans_votes/vote_count) *100
correy_percent = (correys_votes/vote_count) * 100
li_percent = (lis_votes/vote_count)* 100
otooley_percent = (otooleys_votes/vote_count) * 100


output_file = ("Resources/Election_Results_Summary.txt'")

with open(output_file,"w") as file:


    file.write(f"Election Results")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Total Votes: {vote_count}")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Khan: {khan_percent:.3f}% ({khans_votes})")
    file.write("\n")
    file.write(f"Correy: {correy_percent:.3f}% ({correys_votes})")
    file.write("\n")
    file.write(f"Li: {li_percent:.3f}% ({lis_votes})")
    file.write("\n")
    file.write(f"O'Tooley: {otooley_percent:.3f}% ({otooleys_votes})")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Winner: {key}")
    file.write("\n")
    file.write(f"----------------------------")