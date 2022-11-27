# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 1 - 20/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 6
# 6 - Em um levantamento realizado em um hospital, 95 pessoas responderam a seguinte
#     questão: Como você classifica o atendimento recebido? As possíveis respostas estavam
#     classificadas em Péssimo, Ruim, Razoável, Bom ou Excelente. O número de pessoas em
#     cada uma dessas classes pode ser encontrado na tabela (os dados estão na planilha Excel “exercicio6.xls”):
#     Construa o programa em R que calcule e gere o diagrama de Pareto correspondente.

# imports
if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

if (!("qcc") %in% installed.packages()) 
  install.packages("qcc")
library(qcc)

# Fonte de Dados
df6 = read_excel("./dados/exercicio6.xls", skip = 1, col_names = c("qualidade", "numero_pessoas"), col_types = c("text","numeric"))

# Ordenacao pelo Num de Pessoas (Pareto)
df6_ordenado = df6[order(df6$numero_pessoas, decreasing = TRUE),]

# Diagrama de Pareto
pareto.chart(df6_ordenado$numero_pessoas, main= "Pesquisa : Como vc classifica o Atendimento Recebido?", col=heat.colors(length(df6_ordenado$qualidade)),
             ylab = "Frequencia", xlab ="Respostas", names=df6_ordenado$qualidade, las=1, ylim = c(0,100))
