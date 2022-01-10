# 03/12/2021
# diamo una condizione al programma e quest'ultimo (in base al fatto che la condizione si T o F) eseguirà delle istruzioni
# es. x controllare se un numero è > di un altro

x <- 100 # assegno ad x un numero

# posso controllare se è > o < di un altro 
if(x > 10) { # scrivo if e in () scrivo la condizione, in questo caso se x  > di 10
# tra le graffe scrivo le istruzioni da seguire se la condizione è vera
print(paste(x, "is greater than 10")) # stampo a video
}

# [1] "100 is greater than 10"
# se al posto di 100 metto 5 non spunta nulla

# potremmo anche inserire una alternativa " se la condizione non viene soddisfatta fanne un altra"
# tramite "else"
# se la condizione è F il programma esegue le istruzioni nell'else
x <- 5
if(x > 10) {
print(paste(x, "is greater than 10"))
} else {
print(paste(x, "is less than 10"))
}
# [1] "5 is less than 10"

# possiamo indicare + condizioni ed in alternativa a queste una terza via
# tramite l'else if
x <- 10
if(x > 10) {
  print(paste(x, "is greater than 10")) # se è T, il codice si ferma quì, altrimenti continua
} else if (x == 10) {# nuova condizione, x uguale a 10, se è T il codice si ferma quì
  print(paste(x, "is equal to 10"))
} else {
  print(paste(x, "is less than 10")) # il codice arriva fino a quì se le precedenti condizioni sono F
}

# [1] "10 is equal to 10"


