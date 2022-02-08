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
dune.env$Use <- factor(dune.env$Use, ordered = T) # non c'è bisogno di specificare l'ordine con level perchè sono già in ordine alfabetico, altrimenti avrei dovuto specificarli con c("","","")
str(dune.env)

# 30/11/2021
# nb puoi richiamare i dataset anche con data("dune") e data("dune.env") se hai caricato il pacchetto vegan con library(vegan)
# prima fase esplorativa del dataset
# summary statistics
summary(dune) # non ci dicono tanto
summary(dune.env) # è + informativo
# prima colonna ha valori numerici continui
# abbiamo il range compresi tra 2,8 e 11,5 prob. cm di suolo
# media e mediana vicine tra di loro e vicine ai valori del minimo
# summary di un factor abbiamo le frequenze di ciascuna categoria
# se hai dubbi lancia ?dune

# es. posso osservare la distribuzione della variabile numerica A1
# come? tramite un istogramma tramite la funzione hist
hist(dune.env$A1) # in ascissa le modalità e in ordinata la frequenza di A1
# i quadrati rappresentano la frequenza dei valori 
# è la visualizzazione di default, possiamo renderla > leggibile:
# 1. modificare il n di colonne 
hist(dune.env$A1,
     xlab = "Thickness of soil A1 horizon (cm)", # argomento xlab per modificare la label delle ascisse
    main = NULL, # per modificare il titolo, in questo caso per rimuoverlo
    breaks = 10 # x cambiare il numero di colonne
    ) 
# il n di breaks deve essere adeguato, non troppo dispersivo e non troppo sintetico
# con 10 la > parte delle osservazioni è tra 2 e 7 con una certa asimmetria 
# ho due osservaizoni completamente separate dalle altre

# potremmo fare lo stesso con i factor
# non possiam usare gli istogrammi (questi descrivono variabili continue)
# il corrispettivo per una qualitativa è un bar plot
# prima calcoliamo le frequenze delle variabili che abbiamo già visto lanciando il summary però non abbimao assegnato il summary a nulla
# calcoliamo le frequenze con la funzione table che crea delle tabelle di contingenza
# la + semplice riguarda 1 singola variabile es. management
table(dune.env$Management)
# BF HF NM SF 
# 3  5  6  6 
# assegno ad un oggetto
man_counts <- table(dune.env$Management)

# chiamo la funzione barplot sull'oggetto
barplot(man_counts) # in ordinate le frequenze
# hist descrive la variabile continua separandoli con intervalli variabili
# un bar plot ha le frequenze delle categorie e sono intervalli non modificabili
barplot(man_counts, # posso modificarlo
        xlab = "Management type", # per modificare il titolo asse x
        ylab = "Number of plots") # per modificare il nome asse y

# se ci interessa vedere la frequenza di una variabile rispetto ad un altra possiamo utilizzare la funzione table
counts <- table(dune.env$Manure,# associo sempre ad un oggetto
      dune.env$Management) # per vedere la frequenza di manure rispetto a quella di management
# ottengo una matrice
# i nomi delle righe (da 0 a 4) sono i nomi dei livelli di manure
# i nomi delle colonne sono quelli di management
#  BF HF NM SF
  #0  0  0  6  0
  #1  2  1  0  0
  #2  1  2  0  1
  #3  0  2  0  2
  #4  0  0  0  3

# richiamo la funzione barplot
barplot(counts) # le colonne hanno colori differenti
# i colori si riferiranno alla variabile manure
# es NM aveva solo 0 quindi il grigion scuro potrebbe essere zero

# possiamo fornire altri argomenti
barplot(counts,
       xlab = "Management type",
       ylab = "Manure quantity",
       main = "Plot distribuition by Manure adn Management",# x aggiungere un titolo
        legend = rownames (counts),# x la legenda, che nomi dare ai valori associati ai colori
       xlim = c(0, 6)))# per fare spazion definisco i limiti dell'asse x così da evitare sovrapposizioni della legenda

# potremmo calcolare la frequenza vista poco fa rispetto a tuto il database o ad una variabile, condizionando le frequenze
# per farlo creiamo una tabella di contingenza con table
# la diamo in pasto alla funzione prop.table 
prop.table(counts) # invece di avere il conto delle osservazioni abbiamo delle proporzioni
# es. il 30% delle osservazioni corrispondono ad NM con un valore di manure 0
# la somma di tutti i valori riporta ad 1 perchè stiamo calcolando la % su n. tot osservazioni
# per dimostrarlo:
# bf con valore 1 di manure è 2, 2 rispetto a 20 (le righe che abbiamo)n è il 10%
# visualizzerò 10% nella tabella con prop.table

# se vogliamo calcolare le % rispetto a righe o colonne serve argomento margin
prop.table(counts, margin = 1) # 1 = le righe, 2 = colonne, solo 2 possibili margini
# es. al 100% di osservazioni con valore di manure 0 corrispondono al tipo di management NM


# altri grafici standard sono i box plot
# per crearne uno serve 1 variabile quantitativa in y e una qualitativa in x
boxplot(sr ~ dune.env$Use) # sr in funzione dell'uso ~  in funzione di 

# anche quì i nomi sono modificabili

boxplot(sr ~ dune.env$Use,
       xlab = "Use type",
       ylab = "Species richness")

specnumber(dune)
dune.env$sr <- specnumber(dune)
str(dune.env)

#03/12/2021
# riprendiamo dal calclo della sr
# pacchetto vegan -> funzione specnumber
# la funzione calcolerà la ricchezza di specie per ciascun sito (20 volte) sul dataset dune
# se applicata su una matrice di comunità del tipo SITO in riga e SPECIE in colonna calcola la sr nei vari siti
sr <- specnumber(dune)
sr
#1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 #i siti, nomi delle righe
#5 10 10 13 14 11 13 12 13 12  9  9 10  7  8  8  7  9  9  8 #la sr

# sr è un vettore di ricchezza di specie
# possiamo inserirlo all'interno di dune.env
dune.env$sr <- sr # è una variabile integer
str(dune.env) # per vedere se effettivamente la nuova variabile è stata caricata

# vogliam vedere come la sr varia attraverso i diversi tipi di management, in maniera grafica e intuitiva
# i boxplot sono indicati per vedere come una variabile CONTINUA varia nelle diverse categorie
# per crearlo usiamo una particoare sintassi che si chiama formula
# mettiamo la variaible continua per prima, sarà sulla y -> sr, è la variabile dipendente
# dopo mettiamo la tilde ~
# dopo mettiamo la variabile che rappresenta la x, il management, la variabile indipend. che pensiamo determini una variazione
boxplot(sr ~ Management,# vedremo la sr in funzione della gestione
       data = dune.env)#specificare da dove vengono i dati

# possiamo renderlo + leggibile dando i nomi delle labels
boxplot(sr ~ Management,
       data = dune.env,# l'argomento data rende + semplice e chiaro il codice, altrimenti avremmo dovuto specificare $dune.env per ogni variabile
       xlab = "Management Type",
       ylab = "Species richness")



# infine possiamo creare degli scatterplot o grafici a dispersione con DUE VARIABILI CONTINUE
# es. la sr in funzione della profondità dell'orizzonte A1
plot(sr ~ A1,
    data = dune.env,
    xlab = "Thickness of A1 soil horizon (cm)",# importante l'unità di misura
    ylab = "Species richness")
# non ci sono trend particolari


# A. EXPORT DI FIGURE
# hai creato grafici, puoi esportarli
# export  direttamente nel pannello dei plots
# oppure:
# crea cartella dove mettere gli outputs
# sulla tab files nell'environment clicca su new folder -> outputs
png("outputs/sr_vs_a1.png", width = 350, height = 350)#definisci il percorso e il nome dell'immagine che vuoi salvare, definisci altezza e larghezza in pixel
# immediatamente dopo la chiamata png metto le righe di codice per il grafico da esportare
plot(sr ~ A1,
    data = dune.env,
    xlab = "Thickness of A1 soil horizon (cm)",# importante l'unità di misura
    ylab = "Species richness")
dev.off() #con png apriamo un device grafico, come se stessimo aprendo l'otturatore della macchina fotografica, devoff lo chiude
# l'immagine si troverà nella cartella
# se è piccola possiamo modificarne i parametri, aggiungendo anche la risoluzione con argomento res che rappresenta i dpi
png("outputs/sr_vs_a1.png", width = 1800, height = 1800, res = 300)#definisci il percorso e il nome dell'immagine che vuoi salvare, definisci altezza e larghezza
# immediatamente dopo la chiamata png metto le righe di codice per il grafico da esportare
plot(sr ~ A1,
    data = dune.env,
    xlab = "Thickness of A1 soil horizon (cm)",# importante l'unità di misura
    ylab = "Species richness")
dev.off()

# oltre png, funzioni analoghe sono jpg, tiff, pdf etc.


# B. EXPORT DEI DATASET, dei file di testo, dei txt, csv
dune_env_head <- head(dune.env) # la funzione head ci restituisce le prime 6 righe del dataset di default, ammenocchè non indichiamo il n di righe
# possiamo modificare questo comportamento specificando il n di righe
dune_env_head <- head(dune.env, 8) # avremo le prime 8

# creiamo il nostro dune_env_head, sarà il nostro nuovo dataset
# x importare o esportare determinato formato di file:
# primo argomento è il file da esportare dune_env_head
# il secondo la posizione dove vogliamo esportarlo + /il nome che vogliamo dargli, specificando anche il formato
write.table(dune_env_head,
           "outputs/dune_env_head.txt") # abbiamo esportato il nostro primo dataset

# in maniera analoga possiamo esportare in cvs coma separated values (vedi slides) es. stoccare dati tabulari
write.csv(dune_env_head,
         "outputs/dune_env_head.csv", row.names = FALSE) 
# con row.names FALSE è + facile reimportare il dataset, senza usarlo avremo una prima colonna senza intestazine con valori numerici, inutile su R

# C. I PRIMI TEST
# vogliamo testare se 2 specie nella loro distribuzione sono indipendenti o meno
# prima di fare questo trasformiamo la nostra matrice di comunità (abbondanze) in una di presenza\assenza
# valori > di 1 dovranno diventare 1 (presenza)
# funzione decostand del pacchetto vegan

dune_pa <- decostand(dune, method = "pa")
# la struttura della matrice dune avrà solo 0 e 1
# è una matrice di presenza/assenza con valori qualitativi e non quantitativi

# a questo punto vogliamo individuare le due specie + frequenti
# le 2 specie + freq si distribuiscono in maniera analoga o meno?
# potrebbero esserci interazioni che fanno si che x competizione di escludino a vicenda

# per prima cosa troviamo le 2 specie + frequenti
specnumber(dune_pa, MARGIN = 2)
# il margine: facciamo l'operaizone lungo le righe? in questo caso margine 1. LA SOMMA SARà LA SR
# facciamo l'operazione lungo le colonne? margine 2. LA SOMMA SARANNO LE FREQUENZE ASSOLUTE DELLE SPECIE
# otteniamo un vettore di lunghezza 30


# le 2 + frequenti sono Scorautu (18) e Trifrepe (16)

# come si comportano? 
# dobbiamo calcolare una tabella di frequenza tipo:
#       Sp1      Sp2
#uso1
#uso2
#uso3

#possiamo applicare un test x capire se le due specie si comportano in maniera indipendente o meno
# es. un chiquadro 

species_by_use <- aggregate(dune_pa[c("Scorautu", "Trifrepe")], # con c selezioniamo solo le colonne che ci interessano
                           by = list(dune.env$Use), # quì indichiamo cosa vogliamo aggregare e x quale categoria, ci serve una lsita quindi usiamo list
                           FUN = "sum") # come vogliamo aggregare, quale la funzione. Vogliamo LA SOMMA DELLE PRESENZE DELLE 2 SPECIE NELLE 3 CATEGORIE DI USO

# ne risulta una tabella in cui:
# colonna Group.1 = contiene le categorie, i gruppi di uso
# Le altre due colonne sono le specie

# a questo punto come fare il test chiq?

chisq.test(species_by_use[, -1]) # -1 vuol dire rimuovimi la colonna 1
# p-value = o.89 
# è molto alto, non è significativo, quindi non possiamo rifiutare l'ipotesi nulla per cui le frequenze delle due specie siano analoghe
# se fosse stato significativo potevamo rifiutarla e dire che queste sono tra loro indipendenti

#12/01/2022
# D. COSTRUIRE UNA MATRICE DI FREQUENZA DELLE 2 SPECIE NEI DIVERSI SITI SENZA PASSARE X LA FUNZ AGGREGATE
# matrice di 2 righe x 2 colonne
mat <- matrix(c(2, 9, 8, 1), ncol = 2)
# prima colonna abbiamo 2 e 9
# seconda colonna abbiamo 8 e 1

# immaginiamo che le colonne rappresentino 2 specie e i valori siano la presenza in due habitat targhet
# possiamo definire i nomi di colonne e righe
mat <- matrix(c(2, 9, 8, 1), ncol = 2)
colnames(mat) <- c("sp1", "sp2")
rownames(mat) <- c("habitat1", "habitat2")
mat # sono i valori di frequenza
# sp1 rara in habitat1 e frequente in 2; sp2 al contrario
# le due specie hanno distribuzione indipendente dobbiamo testarlo
chisq.test(mat) 
# il p-value è 0,007 -> è significativo, la distribuzione è indipendente

# se avessimo avuto questi valori 
mat <- matrix(c(8, 9, 2, 1), ncol = 2)
colnames(mat) <- c("sp1", "sp2")
rownames(mat) <- c("habitat1", "habitat2")

# le 2 specie sembrerebbero avere distribuzione dipendente
chisq.test(mat) # il p-value è di 1 -> non è significativo, non possiamo parlare di indipendenza

# se il p-value è significativo = DISTRIBUZIONE INDIPENDENTE


# vogliamo vedere se i valori di ricchezza di specie tra un tipo di management e un altro sono significativamente differenti o meno
 # es boxplot
boxplot(sr ~ Management, data = dune.env)  #come la sr vari in funzione del management
# vediamo che HF -> molto ricchi in specie, probabilmente è significativamente diverso da  altri 3
# x testare se questa differenza dipende da questo tipo di gestione:
# usiamo HB e poi gli altri 3 gruppi accorpati
# per vedere se i valori di sr in media sono molto diversi tra quello che è HF e quello che non lo è

# il test 
t.test(dune.env$sr[dune.env$Management == "HF"],
       dune.env$sr[dune.env$Management != "HF"],
      alternative = "greater") # greater è la mia ipotesi, che il primo gruppo abbia valore medio > del secondo
# in parentesi [ mettiamo una condizione logica, selezioniamo solo:
# elementi per cui dune.env$Management è uguale a HF nella prima stringa
# elementi per cui dune.env$Management è != (diverso) da HF

# APPUNTI LAVI
# le differenze sono date dal caso o meno?
#p - value è significativo, possiamo dire che i valori medi sono differenti, come pensavamo guardando il boxplot

# cerchiamo relazione tra due variabili 
plot(dune.env$A1, 
     dune.env$sr)

## TEST DI CORRELAZIONE  ## 

#cor. negativa
cor.test(dune.env$A1,
         dune.env$sr,
         alternative = "less")

#cor positiva
cor.test(dune.env$A1,
         dune.env$sr,
         alternative = "greater")

## MODELLO DI REGRESSIONE LINEARE ##
mod <- lm(hp ~ disp, data = mtcars ) #funizione linera mode hp in funzione (tilde) di disp
mod

# per verificare le proprietà del modello mod
summary(mod)

# GRAFICO DI RETTA DI REGRESSIONE SU SCATTER-PLOT ## 

plot(mtcars$disp,
     mtcars$hp)
str(mod) # funzione structure per verificare la struttura 
mod$coefficients # estrapolo i coefficienti beta0 e beta1 

# funione abline a =intercetta b =coefficiente angolare 
plot(mtcars$disp,
     mtcars$hp)
abline(mod$coefficients[1], mod$coefficients[2])





