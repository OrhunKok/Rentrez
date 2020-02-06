#Load Necessary Packages
library(rentrez)

# Generates a string of ID's and assigns them to a variable named ncbi_ids
ncbi_ids = c("HQ433692.1","HQ433694.1","HQ433691.1")

# Creates an object that fetches data from the NCBI database.
#The database specified is nuccore, and the id's from the ncbi_ids vector will be used to find the FASTA files that match on NCBI.
Bburg = entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#Splitting the sequences into their own vectors
Sequences = strsplit(Bburg,"\\n\\n")

#Convert to dataframe and separating the headers
Sequences = unlist(Sequences)
header = gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq = gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences = data.frame(Name=header,Sequence=seq)

# Removing newline characters
Sequences[,2] = gsub("\\n", "", Sequences[,2])

# Ouput to CSV File
write.csv(Sequences,"Sequences.csv")

