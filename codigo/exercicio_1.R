# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 2 - 27/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 1
# 1 - As taxas de juros recebidas por 10 ações durante um certo período foram (medidas em   porcentagens) 
#     2,59; 2,64; 2,60; 2,62; 2,57; 2,61; 2,50; 2,63; 2,64 (Os dados estão na planilha Excel “exercicio1.xls”).
#     Faça um programa em R para calcular e gerar os gráficos da média, da mediana, do desvio padrão, 
#     da variância, do valor mínimo, do valor máximo e dos quartis Q1 e Q3.

# imports
if (!("readxl") %in% installed.packages()) 
    install.packages("readxl")
library(readxl)

# Fonte de Dados
df = read_excel("./dados/exercicio1.xls", skip = 1, col_names = "taxa_juros", col_types = c("numeric"))

# Media
media =mean(df$taxa_juros)
print(paste("Média Taxas de Juros :", media))

# Mediana
mediana =median(df$taxa_juros)
print(paste("Mediana Taxas de Juros :", mediana))

# Desvio Padrao
desvio_padrao = round(sd(df$taxa_juros),6)
print(paste("Desvio Padrão Taxas de juros:", desvio_padrao))

# Variancia
variancia = round(var(df$taxa_juros),6)
print(paste("Variância Taxas de juros:", desvio_padrao))

# Valor Minimo
valor_min = round(min(df$taxa_juros),2)
print(paste("Valor Minimo Taxas de Juros : ", valor_min))

# Valor Maximo
valor_max = round(max(df$taxa_juros),2)
print(paste("Valor Máximo Taxas de Juros : ", valor_max))

# Quartis Q1 e Q3
quartiz = round(quantile(df$taxa_juros, prob=c(.25,.5,.75)),2)
print(paste("Quartiz Taxas de Juros Q1 : ", quartiz[1]))
print(paste("Quartiz Taxas de Juros Q3 : ", quartiz[3]))






