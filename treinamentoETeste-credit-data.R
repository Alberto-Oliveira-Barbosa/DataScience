## OBJETIVOS DO SCRIPT: Limpar os dados e separar em dados de treinamento e teste para algoritmo de aprendizagem.  
## DATASET: credit-data.csv
## LOCAL: Pasta "dataSets"

# Parte1: Limpeza dos dados

dados = read.csv('dataSets/credit-data.csv')

# a coluna  clienteid não é necessária para os testes 
dados$clientid = NULL

# calcular a média da idade para substituir os valores NA e negativos
media<-mean(dados$age[dados$age>0], na.rm = TRUE)

# Setar a média nos valores negativos e NA's
dados$age<-ifelse(dados$age<0,media, dados$age)
dados$age<-ifelse(is.na(dados$age),media,dados$age)

# escalonamento de atributos
dados[,1:3]<-scale(dados[,1:3])


# Parte 2: separação em dados de treinamento e teste
library(caTools)

# dividir os dados em dois grupos, no caso usando 75% dos dados para TRUE
amostra<-sample.split(dados$default, SplitRatio=0.75)

# divisão dos dados
treinamento<-subset(dados, amostra==TRUE)
teste<-subset(dados, amostra==FALSE)

str(treinamento)
str(teste)
