# Gerar uma amostra para analise (com reposição)
amostra = sample(seq(1:100000), size = 50000, replace = TRUE)

#mostrar o tamanho da amostra
length(amostra)

#Ver o conjunto de dados
View(amostra)

head(amostra)

#Estatísticas básicas
summary(amostra)

#média dos valores
mean(amostra)

#mediana
median(amostra)
#Quartis
quantile(amostra)