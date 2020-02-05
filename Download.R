#Load Necessary Packages
library(rentrez)

# Generates a string of ID's and assigns them to a variable named ncbi_ids
ncbi_ids = c("HQ433692.1","HQ433694.1","HQ433691.1")

# Creates an object that fetches data from the NCBI database.
#The database specified is nuccore, and the id's from the ncbi_ids vector will be used to find the FASTA files that match on NCBI.
Bburg = entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#Splitting the sequences into their own vectors

Bburg

gsub("\\\n\n","cat(\n)",Bburg)

strsplit(Bburg,)

?strsplit

