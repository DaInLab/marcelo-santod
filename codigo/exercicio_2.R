# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 2 - 27/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 2
# 2 - Para facilitar um projeto de ampliação da rede de esgoto de uma certa região de uma cidade, as autoridades tomaram uma amostra de 
#     tamanho 50 dos 270 quarteirões que compõem a região e foram encontrados os seguintes números de casas por quarteirão (os dados estão na 
#     planilha Excel “exercicio2.xls”):  
#     a) Construir uma tabela de frequências;
#     b) Calcular as medidas de posição e as medidas de dispersão;
#     c) Faça um programa em R para calcular e gerar os gráficos.

# imports
if (!("readxl") %in% installed.packages()) 
    install.packages("readxl")
library(readxl)

# Fonte de Dados
df2 = read_excel("./dados/exercicio2.xls", skip = 1, col_names = "num_casas", col_types = c("numeric"))

# Sumario
summary(df2$num_casas)

# a) Tabela de Frequencia
tab_frequencia = table(df2$num_casas)
tab_frequencia

# Amplitude 
valor_min = min(df2$num_casas)
valor_max = max(df2$num_casas)
amplitude = valor_max - valor_min

# k (numero de classes sturges)
k = round(1+ log2(50))

# h (tamanho Classes)
h = round(amplitude/k)

# limites das classes
limite_inferior = valor_min
limite_superior = limite_inferior+(k*h)

# Classes
brk = seq(limite_inferior,limite_superior,h)

# tabela distribuicao de frequencias 
tabela_distr_freq = table(cut(df2$num_casas,breaks = brk, right = FALSE))
tabela_distr_freq


# b) Medidas de Posicao (média, mediana, moda e quartis)
summary(df2)

# Media
media =mean(df2$num_casas)
print(paste("Média Numero Casas :", media))

# Mediana
mediana =median(df2$num_casas)
print(paste("Mediana Numero de Casas :", mediana))

# Moda (posicao com maior frequencia)
modal = unique(df2$num_casas) 
moda = modal[which.max(tabulate(match(df2$num_casas, modal)))]
print(paste("Moda Numero de Casas : ", moda))

# Quartis
quartiz = round(quantile(df2$num_casas, prob=c(.25,.5,.75)),2)
print(paste("Quartiz Num Casass Q1 : ", quartiz[1]))
print(paste("Quartiz Num Casas  Q3 : ", quartiz[3]))

# b) Medidas de Dispersao (amplitude, variancia, desvio padrao e coeficiente de variacao)

# Amplitude
print(paste("Amplitude :", amplitude))

# Variancia
variancia = var(df2$num_casas)
print(paste("Variancia : ",variancia))

# Desvio Padrao
desvio_padrao = sd(df2$num_casas)
print(paste("Desvio Padrao : ",desvio_padrao))

# Coeficiente de Variacao
coef_variacao = desvio_padrao/(mean(df2$num_casas)*100)
print(paste("Coeficiente Variacao : ",coef_variacao))


# tabela distribuicao de frequencias 
tabela_distr_freq = table(cut(df2$num_casas,breaks = brk, right = FALSE))
tabela_distr_freq


# Grafico Histograma
grafico = hist( df2$num_casas,  
                main = "Ampliacao de Rede de Esgoto - Regiao X", 
                xlab = "Numero de Casas", 
                ylab = "Quarteiroes", 
                ylim = c(0,18),
                col = c("royalblue", "yellow", "black", "blue", "orange","lightgray"), 
                border = c("black"),
                breaks = brk,
                right = FALSE,
                axes = FALSE
)

axis(1, at=seq(limite_inferior,limite_superior,h))
axis(2, at=seq(0,valor_max,2))
text(grafico$mids, grafico$counts, labels = grafico$counts, adj = c(0.5, -0.5))

