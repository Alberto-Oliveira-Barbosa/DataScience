## análise de séries temporais

dados <- AirPassengers
dados
# Data de início da série
start(dados)

# Data final da série
end(dados)

plot(dados)

# Dados agregados por ano
plot(aggregate(dados))

# Pegar um ano específico para a análise
ano_1950 <- window(dados, start=(c(1950,1)), end=c(1950,12))

# distribuição mensal dos dados
monthplot(ano_1950)

plot(ano_1950)

#Divisão em tendencias, sazonalidade e fator aleatório
dados_decompostos <- decompose(dados)

# Plot dos dados decompostos 
plot(dados_decompostos)

# dados da década de 50
window(dados, start=(1950), end=c(1960))

