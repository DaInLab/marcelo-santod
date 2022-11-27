# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 1 - 20/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 5
# 5 - Uma pesquisa de opinião perguntou a 124 pessoas qual o antitérmico preferido entre
#     as marcas A, B, C, D e E. Os resultados estão representados na tabela (os dados estão na planilha Excel “exercicio5.xls”):
  

# imports
if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

# Fonte de Dados
df5 = read_excel("./dados/exercicio5.xls", skip = 1, col_names = c("marcas", "numero_pessoas"), col_types = c("text","numeric"))
summary(df5$numero_pessoas)

bp = barplot(df5$numero_pessoas,main="Pesquisa Antitérmico Preferido", xlab = "Marcas", ylab = "Qtde Pessoas", names.arg = df5$marcas, ylim = c(0,50),
        col=c("blue", "yellow", "red","blue", "green"))
text(bp, df5$numero_pessoas+3, labels = df5$numero_pessoas )





