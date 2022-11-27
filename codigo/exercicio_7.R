# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 1 - 20/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 7
# 7 - Foram contabilizados o número de pessoas que foram atendidas em um dia em diversas
# áreas de um hospital. Os resultados obtidos podem ser encontrados na tabela (os dados estão na planilha Excel “exercicio7.xls”):
# Construa o programa em R que calcule e gere o gráfico de barras correspondente.

# imports
if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

# Fonte de Dados
df7 = read_excel("./dados/exercicio7.xls", skip = 1, col_names = c("areas", "num_atendimento"), col_types = c("text","numeric"))

bp = barplot(df7$num_atendimento,main="Atendimentos Diários - Hospital", xlab = "Areas", ylab = "Qtde Atendimentos", names.arg = df7$areas, ylim = c(0,700),
             col=c("blue", "yellow", "red","blue", "green"))
text(bp, df7$num_atendimento+25, labels = df7$num_atendimento )
