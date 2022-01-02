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
