# 19/11/2021
# scarica dataset dune.txt e dune_env.csw
# matrice di comunità con 20 siti e una trentina di specie
# matrice che contiene dati ambientali con 5 variabili per ciascuno dei 20 siti

# come si costruisce un progetto?
# incolla i dati in una cartella in una posizione nota
# nuovo progetto dal menù a tendina in alto a destra su R
# seleziona la catella creata

# per importare i dataset
dune <- read.table("data/dune.txt") # funzione red table per lettura e importazione tabelle
dune.env <- read.csv("data/dune_env.csv") # per importare il dataframe

str(dune) # per controllare la struttura del dato ed essere sicuri di aver importato i dati in maniera giusta
str(dune.env)

#'data.frame':	20 obs. of  5 variables:
#$ A1        : num  2.8 3.5 4.3 4.2 6.3 4.3 2.8 4.2 3.7 3.3 ...
#$ Moisture  : int  1 1 2 2 1 1 1 5 4 2 ...
#$ Management: chr  "SF" "BF" "SF" "SF" ...
#$ Use       : chr  "Haypastu" "Haypastu" "Haypastu" "Haypastu" ...
#$ Manure    : int  4 2 4 4 2 2 3 3 1 1 ...

# se ho dubbi posso consultare la lubrary di vegan che contiene il dataset
library(vegan)
?dune # si apre la pagina del manuale relativa al dataset
#The dune meadow vegetation data, dune, has cover class values of 30 species on 20 sites.
# mi dice tutti i formati dei dati
# a volte il manuale mi dice che ho dei dati ma nel dataset trovo degli integer o dei character invece che fattori ordinati
# in questo caso devo modificare:

# devo modificare la formattazione di dune.env, importarlo diversamente
dune.env <- read.csv("data/dune_env.csv",
                    stringsAsFactors = TRUE) # l'argomento mi serve x fare in modo che tutte le colonne con parole vengono importate come fattori

dune.env$Moisture <- factor(dune.env$Moisture, ordered = T) # moisture era ancora un integer, lo modifico e al suo posto incollo il risutlato della funzione factor
dune.env$Manure <- factor(dune.env$Manure, ordered = T) # lo stesso com manure
dune.env$Use <- factor(dune.env$Use, ordered = T) # non c'è bisogno di specificare l'ordine con level perchè sono già in ordine alfabetico





