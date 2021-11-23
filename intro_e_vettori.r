# Biometria e Statistica modulo 2, Pietro Zannini
# 02/11/2021

# il primo comando su RStudio 
# con la funzione print posso immettere messaggi nella funzione
print("Hello World!") # per mandare il comando su RStudio clicca ctrl+invio

# posso usare RStudio come una calcolatrice
1 + 1 # lancio con ctrl+invio e ottengo il risultato in console
2-1 # sottraggo
2*3 # moltiplico
4/2 # divido
3^2 # posso esponenziare tramite il simbolo ^ (anche 3**2)
5 %% 2 #tramite %% posso ottenere il resto di 5/2 --> fa 2 con il resto di 1 (1 è il resto detto anche modulo).
# tramite %% posso capire se un numero è pari o dispari, se è pari e lo divido per 2 il resto sarà = 0
5 %/% 2 # per calcolare il quoziente della divisione, la parte a sinistra della virgola

# per creare variabili che contengano i miei valori uso il simbolo dell'assegnazione <-
x <- 42 # la variabile è x che contiene 42 al suo interno. Posso visualizzarla sull'environment sulla dx
x # se scrivo x in console visualizzo cosa contiene la variabile x

# Possiamo creare + variabili e fare operazioni
my_apples <- 5 # ho 5 mele
my_oranges <- 6 # ho 6 arance
my_apples + my_oranges # ctrl + invio e avrò il tot
rm(x) # funzione rm (remove) se voglio rimuovere una variabile 
x # se rilancio la variabile avrò un errore

ls() # funzione list per visualizzare tutto quello che abbiamo creato, e che è presente in environment, sulla console

# scrivo + variabili, corrispondono ai 3 tipi di dati in R

my_numeric <- 42 # dato di tipo numerico, i numerici si dividono in 2 sottogruppi
my_integer <- 42L # i numeri interi (integer). Se voglio specificare che è un integer aggiungo L perchè il default è sempre decimale
my_double <- 42.24 # i numeri decimali (double). Il separatore decimale è SEMPRE il punto

my_character <- "universe" # dati sottoforma di testo (character), sempre tra virgolette "" oppure ''

my_logical <- T # i valori logici, dei veri T e falsi F (1 e 0). sempre MAIUSCOLO. 
# T = TRUE
# F = FALSE # evitare di utilizzare T o F come nomi di variabili per evitare errori di sintassi

# funzione class per restituire la CLASSE dell'oggetto, capire il tipo di dato
class(my_numeric) # sulla console mi dice la classe corrispondente
class(my_interger)
class(my double) # è un numeric 
class(my_character)
class(my_logical)

# funzione c (combine) per creare vettori legando + elementi
# vettore numerico
my_numeric_vector <- c(1, 10, 49) # scelgo il nome per la mia variabile, in parentesi dopo c metto gli elementi divisi dalle virgole
# ho creato un vettore di tipo numerico con 3 elementi
my_numeric_vector # per visualizzarlo

# vettore di characters
my_character_vector <- c("a", "b", "c") #le lettere sempre tra " altrimenti R cerca una variabile corrispondente
my_character_vector
# se chiamando il vettore ometto le parentesi 
my_character_vector <- c("a", "b", "c", x) # R cerca la variabile x e scrive i valori corrispondenti (in questo caso 42). Sto forzando un tipo di dati in un altro
my_character_vector # per visualizzarlo

# vettore di logical
my_logical_vector <- c(T, T, F, T) # anche my_logical_vector <- c(TRUE, TRUE, FALSE, TRUE)
my_logical_vector # per visualizzarlo

# operazioni tra vettori
my_apples_vector <- c(50, 70, 80, 30, 150)
my_apples_vector
my_oranges_vector <- c(40, 60, 80, 100, 80)
my_oranges_vector

# avendo i vettori corrispondenti alla frutta raccolta, voglio il valore tot x giorno tra mele e arance
my_fruit_vector <- my_apples_vector + my_oranges_vector # sommo i 2 vettori che hanno la stessa lunghezza
my_fruit_vector # visualizzo il vettore corrispondente alla somma degli oggetti

# se i vettori hanno lunghezze differenti
my_apples_vector <- c(50, 70, 80, 30, 150)
my_apples_vector
my_oranges_vector <- c(40, 60, 80, 100)
my_oranges_vector
my_fruit_vector <- my_apples_vector + my_oranges_vector # sommo i 2 vettori di lunghezze differenti
my_fruit_vector # messaggio di warning che dice che per i due vettori, 1 NON è il multiplo dell'altro
# l'ultimo valore, 190, è l'ultimo del + lungo e il primo del + corto. Il + corto viene riciclato

# diversi modi per creare sequenze, vettori 
1:10 # se voglio una lista di numeri da 1 a 10
10:1 # anche decrescenti 

# creare vettore tramite ripetizione
# funzione rep
rep(c("a", "b", "c"), times = 2) 
# come primo argomento scrivo cose voglio ripetere es. quì un vettore quindi mettiamo all'interno la funzione c
# il seconodo argomento dopo la virgola è detto times e indica il numero di volte che voglio ripetere il vettore
# così ottengo in console --> "a" "b" "c" "a" "b" "c"

# se vogliamo che ogni elemento venga ripetuto un determinato n e che poi si passi all'elemento succ. utilizzo l'argomento each
rep(c("a", "b", "c"), each = 2) # per ottenere "a", "a", "b", "b", "c", "c"

# 05/11/2021 continuazione sui vettori
1:10 #sequenza da 1 a 10
seq(1,10) # con la funzione seq ottengo lo stesso ma inconveniente perchè utilizzo + caratteri
seq(1, 10, by = 2) # posso ottenere lo stesso utilizzando 3 argomenti, l'argomento by ci da gli step, otteniamo tutti i dispari tra 1 e 10
seq(10, 1, by = -2) # su by devo dare anche la direzione che in questo caso deve sottrarre

# torniamo a costruire i vettori
apples_vector <- c(20, 50, 30, 40, 100) # numero di mele e arance raccolte durante la settimana
oranges_vector <- c(70, 70, 50, 20, 80) # si tratta di vettori numerici, non sono integer perchè avremmo dovuto specificare il valore integer con una L

# il giorno della settimana corrispondete ci viene dato dalla posizione nel vettore, ma se ho tanti dati?
# posso dare dei nomi a ciascun elemento all'interno del vettore tramite la funzione names
# funzione names
names(apples_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday") # assegno dei nomi a ciascun valore --> il 1° si chiamerà Monday e così via
names(apples_vector) # visualizzo i nomi
apples_vector # visualizzo i nomi e i valori corrispondenti

# facciamo lo stesso con il secondo vettore
names(oranges_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(oranges_vector)
oranges_vector

# posso sommarli per creare un solo vettore
oranges_vector + apples_vector # i nomi vengono ereditati perchè sono gli stessi

# funzine typeof per risalire al tipo di dato
typeof(1:3) # [1] "integer"
typeof(oranges_vector) # è double perchè non abbiamo specificato la L

# funzione per testare se un valore appartiene ad un tipo o meno -> funzioni che iniziano con is
is.numeric(oranges_vector) # [1] TRUE
is.character(oranges_vector) # [1] FALSE
is.double(oranges_vector) # [1] TRUE
is.integer(oranges_vector) # [1] FALSE
is.logical(oranges_vector) # [1] FALSE

# funzioni che ci permettono di coercere (convertire) un dato in un altro tipo -> funzioni che iniziano per as
as.character(oranges_vector) # avrò gli stessi valori ma all'interno di virgolette perchè sono diventati character
as.logical(oranges_vector) # tutti i valori verranno convertiti in TRUE perchè qualsiasi valore diverso da zero è T
typeof(c("a", "b")) # [1] "character" , se ho + parentesi sto annidando una funzione
is.character(c("a", "b")) # [1] TRUE 

# funzione lenght per ottenere il numero di elementi del vettore
logical_vector <- c(T,F)
length(logical_vector) # [1] 2
length(oranges_vector) # [1] 5

# INDICIZZAZIONE, creare sottoset di dati
# come selezionare gli elementi dei vettori -> tramite il nome
apples_vector["Wednesday"] # seleziono il giorno che mi interessa: nome+parentesi quadre
# Wednesday: 30 -> ho trovato il valore, posso assegnarlo ad un altra variabile
apples_wednesday <- apples_vector["Wednesday"]
apples_wednesday # lo visualizzo
# vale lo stesso per un vettore di + nomi
apples_vector[c("Monday", "Friday")] # voglio estrarre solo venerdì e lunedì

# come selezionare gli elementi dei vettori -> tramite la posizione
apples_vector[1]
apples_vector[5]
# se non ci ricordiamo quanto è lungo il vettore, possiamo estrarre l'ultimo, quello con la posizione pari alla lunghezza, richiamando la funzione lengh
apples_vector[length(apples_vector)] # applico la funzione length al vettore stesso
apples_vector[1:3] # se voglio ottenere i primi tre valori
apples_vector[3:1] # se scrivo così cambio l'ordine e ottengo l'inverso

# metodi sottrattivi per ottenere tutti i valori tranne alcuni
apples_vector[-c(1,3)] # escluderò 2 valori, solo con i numerici
apples_vector[-(1:3)] # escluderà i primi 3

# come vedere quali elementi soddisfano condizioni (<,>,= etc.)
apples_vector > 80 # ottengo un T e F in base a quali soddisfano la condizione
# Monday   Tuesday Wednesday  Thursday    Friday 
#   FALSE     FALSE     FALSE     FALSE      TRUE
selection_vector <- apples_vector > 80 # lo rinomino
apples_vector[selection_vector] # ottengo solo il venerdì
apples_vector[apples_vector < 80] # tutti gli elementi < di 80, con questa dicitura ho direttamente gli emeneti e non i F e T
apples_vector[apples_vector <= 40] # minore uguale
apples_vector[apples_vector >= 40] # maggiore uguale
apples_vector[apples_vector == 40] # elementi uguali ad un particolare valore
apples_vector[apples_vector != 40] # ! per negare, vuol dire NON uguale



