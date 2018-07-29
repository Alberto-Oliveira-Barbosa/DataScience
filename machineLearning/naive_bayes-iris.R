## OBJETIVOS DO SCRIPT: Testar o algoritmo Naive Bayes
## DATASET: iris
## LOCAL: R

dados <- iris

# Separação dos dados em treinamento e teste
library(caTools)
amostra <- sample.split(dados$Species, SplitRatio = 0.60)
table(amostra)
treinamento <- subset(dados, amostra==TRUE)
teste <- subset(dados, amostra==FALSE)

# Criar o modelo de aprendizado
library(e1071)
classificador <- naiveBayes(x = treinamento[-5], y=treinamento$Species)

# Testando o modelo
previsao<-predict(classificador, newdata=teste[ ,1:4])

# Variável auxiliar para fazer a contagem de acertos.
teste_previsao <- ifelse(previsao==teste[,5],'Acertou', 'Errou')
table(teste_previsao)

