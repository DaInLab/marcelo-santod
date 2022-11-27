# Lista de Exercicios TOPICO 8
# Disciplina Ciencia de Dados 2o Semestre 2022
# Professor : Joao Pedro Albino
# Aluno : Marcelo Jose dos Santos
# Versao 1 - 20/11/2022
# Workspace : D:/GoogleDrive/Mestrado_unesp/2022_02_CIENCIA_DE_DADOS/marcelo-santos

# Exercicio 3
# Numa pesquisa realizada com 100 famílias, levantaram-se as seguintes informações:
# Número de filhos 0 1 2 3 4 5 Mais de 5
#         Famílias 17 20 28 19 7 4 5
# a) Construir a planilha em Excel ou Calc (LibreOffice) com as informações acima.
# b) Faça um programa em R para calcular e gerar os gráficos para:
#    1. A mediana do número de filhos; e
#    2. A moda do número de filhos

# imports
if (!("writexl") %in% installed.packages()) 
  install.packages("writexl")
library("writexl") 

# Cria um dataframe Exercicio 3
df3 = data.frame (
  num_filhos = c('0','1','2','3','4','5','Mais de 5'),
  qtd_familias = c(17,20,28,19,7,4,5)
)

# Criando arquivo exercicio3.xlsx
write_xlsx(df3, "./dados/exercicio3.xlsx")

# Mediana 
mediana =median(df3$num_filhos)
print(paste("Mediana :", mediana))

# Moda 
moda = (df3$num_filhos)
modal = unique(df3$num_filhos) 
moda = modal[which.max(tabulate(match(df3$num_filhos, modal)))]
print(paste("Moda : ", moda))


# Grafico Barras
grafico3 = barplot(df3$qtd_familias,main="Pesquisa Numero de Filhos por Famlia", xlab = "Num Filhos", ylab = "Qtde Familias", names.arg = df3$num_filhos, ylim = c(0,50),
             col=c("blue", "yellow", "red","blue", "green"), cex.names = "teste")
text(grafico3, df3$qtde_familias+3, labels = df3$qtd_familias )


# grafico ?
boxplot(df3$Qtd_familias)

abline(a = mediana, b = 0L, h = NULL, v = T)
abline(a = moda, b = 0L, h = NULL, v = T)





