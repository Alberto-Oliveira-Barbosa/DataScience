# Importar e analisar o dataframe CREDIT-DATA
dados = read.csv('dataSets/credit-data.csv')
View(dados)

# ANÁLISE PRELIMINAR

#Os dados são divididos em 2000 registros e 5 colunas: 
#   ClientId - id do cliente
#   Income - Renda do cliente
#   Age - Idade do cliente
#   Loan - Divida do cliente
#   Default - Se o impréstimo foi quitado (0 - não, 1 - Sim)

# a coluna  clienteid não é necessária para a analise
dados$clientid = NULL

# Verificar os dados:
summary(dados)

# SEGUNDA ANÁLISE:

#Colunas Income, Loan, Default estão dentro da normalidade.
#Coluna Age possui dados negativos e valores NA

# Filtrar todos os dados inconsistentes
dados[dados$age<0, ]

# Filtrar os dados sem os valores NA's
dados[dados$age<0 & !is.na(dados$age), ]

# calcular a média da idade, excluindo os valores negativos e os NA's
media<-mean(dados$age[dados$age>0], na.rm = TRUE)
media

# Setar a média nos valores negativos
dados$age<-ifelse(dados$age<0,media, dados$age)

#setar a média nos valores NA's
dados$age<-ifelse(is.na(dados$age),media,dados$age)
summary(dados)

# Categorizar (Classificar) a variável Default
dados$default<-factor(dados$default)

# Alterar o label da variável default
levels(dados$default)<-c('Devedor', 'Quitado')
summary(dados)

#Alterar o nome das colunas para facilitar a visualização dos dados
names(dados)<-c('RENDA','IDADE','DÌVIDA','SITUAÇÃO DO EMPRÉSTIMO')
View(dados)
