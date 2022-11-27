# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 2 - 27/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 9
# Em um hospital foram coletados os salários (em salários mínimos) de 36 funcionários.
# Os resultados estão dispostos na tabela (os dados estão na planilha Excel “exercicio9.xls”):
# Construa o programa em R que calcule e gere a distribuição de frequências em intervalos
#  de amplitude 2 e o histograma correspondente.
  
# imports
if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

# Fonte de Dados
df9 = read_excel("./dados/exercicio9.xls", skip = 1, col_names = "salarios", col_types = c("numeric"))

# a) Tabela de Frequencia
tab_frequencia = table(df9$salarios)

# Amplitude 
valor_min = min(df9$salarios)
valor_max = max(df9$salarios)
amplitude = valor_max - valor_min

# h (intervalo - tamanho Classes)
h = 2

# k (numero de classes com intervalo 2)
k = amplitude/h


# limites das classes
limite_inferior = valor_min
limite_superior = limite_inferior+(k*h)

# Classes com amplitude 2
brk = seq(limite_inferior,limite_superior,h)
brk

# tabela distribuicao de frequencias 
tabela_distr_freq = table(cut(df9$salarios,breaks = brk, right = FALSE))
tabela_distr_freq

# Grafico Histograma
grafico9 = hist( df9$salarios,  
                 main = "Histograma Salarios - 36 funcionarios", 
                 xlab = "Salarios Minimos", 
                 ylab = "Num Funcionarios", 
                 ylim = c(0,10),
                 col = c("blue"), 
                 border = c("black"),
                 breaks = brk,
                 right = FALSE,
                 axes = FALSE
)

axis(1, at=seq(limite_inferior,limite_superior,h))
axis(2, at=seq(0,26,2))
text(grafico9$mids, grafico9$counts, labels = grafico9$counts, adj = c(0.5, -0.5))