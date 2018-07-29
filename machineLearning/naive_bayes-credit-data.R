## OBJETIVOS DO SCRIPT: Aplicar o algoritmo naive bayes na base de dados credit-data  
## DATASET: credit-data.csv
## LOCAL: Pasta "dataSets"

dados = read.csv('./dataSets/credit-data.csv')

#limpeza
dados$clientid = NULL
dados$age<-ifelse(dados$age<0, mean(dados$age[dados$age>0], na.rm = TRUE), dados$age)
dados$age<-ifelse(is.na(dados$age), mean(dados$age[dados$age>0], na.rm = TRUE),dados$age)
dados$default<-factor(dados$default, levels = c(0,1))

# Base para teste e treinamento
library(caTools)
amostra<-sample.split(dados$default, SplitRatio=0.75)
treinamento<-subset(dados, amostra==TRUE)
teste<-subset(dados, amostra==FALSE)

#Modelo
library(e1071)
classificador <- naiveBayes(x=treinamento[-4], y=treinamento$default)
previsao <- predict(classificador, newdata = teste[-4]) 
acertos<- ifelse(teste$default==previsao,"Acertou",'Errou')

sprintf('Precisão de %s%% de acertos do modelo.',table(acertos)[[1]][1]/500*100)
