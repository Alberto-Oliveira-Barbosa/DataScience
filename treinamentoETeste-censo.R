## OBJETIVOS DO SCRIPT: Limpar os dados e dividi-los em uma base para treinamento e teste
## DATASET: census.csv
## lOCAL: Pasta "dataSets"
# Carregar dataset e visualizar estatísticas para entendimento do mesmo

# Parte 1: Limpeza dos dados
dados<-read.csv('dataSets/census.csv')

# A coluna de identificação não é necessária para os treinamentos
dados$X<-NULL

# Converter as variáveis nominais em contínuas
dados$sex = factor(dados$sex, levels = c(' Female', ' Male'), labels = c(0, 1))
dados$workclass = factor(dados$workclass, levels = c(' Federal-gov', ' Local-gov', ' Private', ' Self-emp-inc', ' Self-emp-not-inc', ' State-gov', ' Without-pay'), labels = c(1, 2, 3, 4, 5, 6, 7))
dados$education = factor(dados$education, levels = c(' 10th', ' 11th', ' 12th', ' 1st-4th', ' 5th-6th', ' 7th-8th', ' 9th', ' Assoc-acdm', ' Assoc-voc', ' Bachelors', ' Doctorate', ' HS-grad', ' Masters', ' Preschool', ' Prof-school', ' Some-college'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16))
dados$marital.status = factor(dados$marital.status, levels = c(' Divorced', ' Married-AF-spouse', ' Married-civ-spouse', ' Married-spouse-absent', ' Never-married', ' Separated', ' Widowed'), labels = c(1, 2, 3, 4, 5, 6, 7))
dados$occupation = factor(dados$occupation, levels = c(' Adm-clerical', ' Armed-Forces', ' Craft-repair', ' Exec-managerial', ' Farming-fishing', ' Handlers-cleaners', ' Machine-op-inspct', ' Other-service', ' Priv-house-serv', ' Prof-specialty', ' Protective-serv', ' Sales', ' Tech-support', ' Transport-moving'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14))
dados$relationship = factor(dados$relationship, levels = c(' Husband', ' Not-in-family', ' Other-relative', ' Own-child', ' Unmarried', ' Wife'), labels = c(1, 2, 3, 4, 5, 6))
dados$race = factor(dados$race, levels = c(' Amer-Indian-Eskimo', ' Asian-Pac-Islander', ' Black', ' Other', ' White'), labels = c(1, 2, 3, 4, 5))
dados$native.country = factor(dados$native.country, levels = c(' Cambodia', ' Canada', ' China', ' Columbia', ' Cuba', ' Dominican-Republic', ' Ecuador', ' El-Salvador', ' England', ' France', ' Germany', ' Greece', ' Guatemala', ' Haiti', ' Holand-Netherlands', ' Honduras', ' Hong', ' Hungary', ' India', ' Iran', ' Ireland', ' Italy', ' Jamaica', ' Japan', ' Laos', ' Mexico', ' Nicaragua', ' Outlying-US(Guam-USVI-etc)', ' Peru', ' Philippines', ' Poland', ' Portugal', ' Puerto-Rico', ' Scotland', ' South', ' Taiwan', ' Thailand', ' Trinadad&Tobago', ' United-States', ' Vietnam', ' Yugoslavia'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41))
dados$income = factor(dados$income, levels = c(' <=50K', ' >50K'), labels = c(0, 1))

# escalonar os atributos
dados$age<-scale(dados$age)
dados$final.weight<-scale(dados$final.weight)
dados$education.num<-scale(dados$education.num)
dados[, 11:13]<-scale(dados[, 11:13])


# Parte 2: separação em dados de treinamento e teste
library(caTools)

# dividir os dados em dois grupos, no caso usando 85% dos dados para TRUE
amostra<-sample.split(dados$income, SplitRatio=0.85)

# divisão dos dados
treinamento<-subset(dados, amostra==TRUE)
teste<-subset(dados, amostra==FALSE)
