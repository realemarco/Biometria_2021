# caratteristiche delle metrici: bidimensionali e omogenee
matrix(1:9, nrow=3) # valori da 1 a 9 e  3 righe
#     [,1] [,2] [,3]  in [] sono gli indici di colonne e righe
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9

# creaiamo una nuova matrice dei campionamenti di 2 specie di passeriformi
garden <- c(10, 2) # numeri per il giardino
forest <- c(8, 3) # per una foresta
hedgerow <- c(1, 12) # per le siepi

# ho i vettori, posso creare la matrice di comunità in cui vengono indicate le comunità biotiche nelle varie località
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3) # i siti nelle righe
community_matrix
#     [,1] [,2]
#[1,]   10    3
#[2,]    2    1
#[3,]    8   12  
# l' ordine così è errato perchè manca l'argomento byrow che di default è falso e i valori vengono riempiti per colonna
# se scriviamo byrow = TRUE otteniamo un riempimento della matrice per riga
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3, byrow=T) # i siti nelle righe
community_matrix
#     [,1] [,2]
#[1,]   10    2 garden
#[2,]    8    3 forest
#[3,]    1   12 hedgerow

species <- c("Parus major", "Erithacus rubecula") # saranno i nomi delle colonne
sites <- c("Garden", "Forest", "Hedgerow") # i nomi delle righe
colnames(community_matrix) <- species # per rinominare le colonne
rownames(community_matrix) <- sites # per rinominare le righe
community_matrix

#         Parus major Erithacus rubecula
#Garden            10                  2
#Forest             8                  3
#Hedgerow           1                 12

# vogliamo ingrandire la matrice con nuovi dati
# sei a 1,41


