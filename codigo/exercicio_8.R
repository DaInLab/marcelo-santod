# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 1 - 20/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 8
# Um hospital tem o interesse em determinar a altura média dos pacientes de uma
# determinada área e relacioná-la com a incidência de determinada anomalia ortopédica.Foram selecionados 80 pacientes e 
# as alturas (em m) podem ser encontradas na tabela (os dados estão na planilha Excel “exercicio8.xls”):

# imports
if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

# Fonte de Dados
df8 = read_excel("./dados/exercicio8.xls", skip = 1, col_names = "altura_pacientes", col_types = c("numeric"))

# a) Tabela de Frequencia
tab_frequencia = table(df8$altura_pacientes)
tab_frequencia

# Amplitude 
valor_min = min(df8$altura_pacientes)
valor_max = max(df8$altura_pacientes)
amplitude = valor_max - valor_min

# k (numero de classes sturges - 80)
k = round(1+ log2(80))

# h (tamanho Classes)
h = round((amplitude/k),2)

# limites das classes
limite_inferior = valor_min
limite_superior = limite_inferior+(k*h)

# Classes
brk = seq(limite_inferior,limite_superior,h)

# tabela distribuicao de frequencias 
tabela_distr_freq = table(cut(df8$altura_pacientes,breaks = brk, right = FALSE))
tabela_distr_freq

# Grafico Histograma
grafico8 = hist( df8$altura_pacientes,  
                main = "Histograma Altura Pacientes Area x - Anomalia Ortopédica", 
                xlab = "Altura", 
                ylab = "Quantidade", 
                ylim = c(0,26),
                col = c("royalblue", "yellow", "black", "gray", "orange","red"), 
                border = c("black"),
                breaks = brk,
                right = FALSE,
                axes = FALSE
)

axis(1, at=seq(limite_inferior,limite_superior,h))
axis(2, at=seq(0,26,2))
text(grafico8$mids, grafico8$counts, labels = grafico8$counts, adj = c(0.5, -0.5))


