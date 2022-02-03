# fine lezione 09/11/2021
# dataframe = genere di dati rettangolari anche non omogenei (es colonne con integer, characters etc.
# il mio primo dataframe
 dat <- data.frame( # funzione per creare dataframe, parentesi e a capo x la prima colonna (è + comodo leggere il codice in verticale)
				  id = 1:6,  # prima colonna, sequenza di valori interi da 1 a 6 (ogni nuova riga sarà una nuova colonna)
				  name = c("Eokochia saxicola", "Cytisus aeolicus", "Anthemis aeolica", "Centaurea aeolica", "Silene hicesia", "Genista tyrrhena"), # seconda colonna, nomi delle specie
				  has_legumes = c(F, T, F, F, T , F), # terza colonna su quale è leguminosa
				  population_size = c(50, 2000, 5000, 10000, 200, 3000), # quanti individui per ciascuna specie ci sono alle eolie
				  growth_form = c("Herb", "Tree", "Herb", "Shrub", "Herb", "Tree") # tipo di forma di crescita
				)
dat
#  id              name has_legumes population_size growth_form
#1  1 Eokochia saxicola       FALSE              50        Herb
#2  2  Cytisus aeolicus        TRUE            2000        Tree
#3  3  Anthemis aeolica       FALSE            5000        Herb
#4  4 Centaurea aeolica       FALSE           10000       Shrub
#5  5    Silene hicesia        TRUE             200        Herb
#6  6  Genista tyrrhena       FALSE            3000        Tree

# diverse colonne possono avere diverti tipi di dati ma hanno sempre i nomi, così come le righe (ma + semplici, sono gli indici)
# le righe quì sono idicate dagli indici, le righe devono avere SEMPRE un nome ne dataframe, questo è quello di default
# la lunghezza delle colonne DEVE essere costante

# 12/11/2021
# continua dataframe
# possiamo applicare le stesse operazioni delle matrici

# per calcolare le dimensioni del dataframe
dim(dat)
# [1] 6 5 # sei righe e 5 colonne

# calcolare il numero di righe
nrow(dat)

# calcolare il numero di colonne
ncol(dat)

# calcolare le summary per le singole colonne (statistiche sommarie)
summary(dat)

#       id           name           has_legumes     population_size  
#Min.   :1.00   Length:6           Mode :logical   Min.   :   50  
#1st Qu.:2.25   Class :character   FALSE:4         1st Qu.:  650  
#Median :3.50   Mode  :character   TRUE :2         Median : 2500  
#Mean   :3.50                                      Mean   : 3375  
#3rd Qu.:4.75                                      3rd Qu.: 4500  
#Max.   :6.00                                      Max.   :10000  


#growth_form       
#Length:6          
#Class :character  
#Mode  :character

# verificare la classe del dataframe
class(dat)
# [1] "data.frame"

# vedere la struttura
str(dat)

# come selezionare/indicizzare elementi su dataframe
# se voglio estrarre la prima riga
dat["1", ] # metto il nome della prima riga e nulla per la colonna
# oppure
dat[1, ] # metto l'id della prima riga, il risultato è identico

# se seleziono + righe
dat[1:2, ] # prenderò le prime due righe
# oppure
dat[c("1", "2"), ]

# è lo stesso per le colonne
dat[, 2] # estraggo la seconda colonna, non ottengo + un dataframe
# ottengo un vettore, gli indici mi dicono che ho solo 1 dimensione

# per non perdere la struttura facendo questa operazione (anche per le matrici)
dat[, 2] # così ottengo il vettore, coercizione del dato, trasformazione
# se voglio la colonna name mantenendo la struttura dataframe:
dat[, 2, drop = F] # argomenton drop =F --> "non cedere la struttura"
# il risuktato non è + una sequenza vettoriale ma somiglia + al dataframe originale, ho i nomi delle righe, il nome della colonna, non ho le virgolette etc.

# altre maniere per subsettare i dataframe
dat["name"] # nome del dataframe + nome della colonna, non funziona per le righe
# mantengo il dataframe

# usando la doppia parentesi quadra
dat[["name"]] # così ottengo un vettore

dat[c("name", "id")] # così ottengo 2 colonne e mantengo per entrambe la struttura

dat[[c("name", "id")]] # così ho un errore, la doppia parentesi [ può essere utilizzata per estrarre 1 e UNA SOLA colonna, componente etc. 

# possiamo combinare righe e colonne
dat[c("5", "6"), c("id", "name")]

# possiamo estrarre colonne con operatori particolari 
# $ per riferirci ad una colonna del dataframe
dat$id # ottengo un vettore contenente i valori della colonna id

# usare TRUE e FALSE per subsettare
dat[dat$has_legumes == T] # oppure dat[dat$has_legumes != T] # divderso da

# come rimuovere totalmente una colonna
dat <- dat [, -4] # tolgo la colonna population_size
# oppure
dat£growth_form <- NULL
dat

# possiamo usar le funzioni cbind 
cbind(dat, 1:6) # per aggiungere una colonna con una sequenza da 1 a 6
cbind(dat, fid = 1:6) # se voglio anche dare un nome alla colonna 
# non posso fare lo stesso per le righe perchè non possiamo creare vettori con tip di dati diversi
# se volessi aggiungere una settima riga dovrei dare dati tutti di classi diversi che non possono essere contenuti nei vettori 

# per aggiungere colonna, oltre cbind:
dat$id.2 <- 1:6 # dollaro + la nuova colonna da creare, se non assegno i valori spunta NULL

# se voglio aggiungere righe devo creare un nuovo dataframe
new_data <- data.frame(
	id = 7,
	name = "Limonium minutiflorum", 
	has_legumes = F,
	id.2 = 7
	)
# posso aggiungerlo a dat usando la funzione rbind
rbind(dat, new_data)
dat <- rbind(dat, new_data) # se voglio sovrascrivere la nuova versione





