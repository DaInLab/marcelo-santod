# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 2 - 27/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 4
# Considere as informações contidas na tabela (os dados estão na planilha Excel “exercicio4.xls”) 
# acerca dos salários de 20 funcionários de um hospital. Faça uma distribuição de frequências e o gráfico histograma correspondente em R.


# imports
if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

# Fonte de Dados
df4 = read_excel("./dados/exercicio4.xls", skip = 1, col_names = "salarios", col_types = c("numeric"))
d = df4$salarios

# a) Tabela de Frequencia
tab_frequencia = table(df4$salarios)
tab_frequencia

# Amplitude 
valor_min = min(df4$salarios)
valor_max = max(df4$salarios)
amplitude = valor_max - valor_min

# k (numero de classes sturges - 20)
k = round(1+ log2(20))

# h (tamanho Classes)
h = round((amplitude/k),2)

# limites das classes
limite_inferior = valor_min
limite_superior = limite_inferior+(k*h)

# Classes
brk = seq(limite_inferior,limite_superior,h)

# tabela distribuicao de frequencias 
tabela_distr_freq = table(cut(df4$salarios,breaks = brk, right = FALSE))
tabela_distr_freq

# Grafico Histograma
grafico4 = hist( df4$salarios,  
                main = "Histograma dos Salarios de 20 Funcionarios", 
                xlab = "Qtde Salarios Minimos", 
                ylab = "Qtde Funcionarios", 
                ylim = c(0,8),
                col = c("royalblue", "yellow", "black", "blue", "orange","lightgray"), 
                border = c("black"),
                breaks = brk,
                right = FALSE,
                axes = FALSE
)

axis(1, at=seq(limite_inferior,limite_superior,h))
axis(2, at=seq(0,valor_max,2))
text(grafico4$mids, grafico4$counts, labels = grafico4$counts, adj = c(0.5, -0.5))


