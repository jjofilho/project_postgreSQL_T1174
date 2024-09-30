
import pandas as pd
import numpy as np

# Foi utilizado a seguinte base de dados:
# https://www.kaggle.com/datasets/ayushparwal2026/online-ecommerce
dfe = pd.read_csv('C:\\Users\\diogo\\OneDrive\\Documentos\\Profissional\\Flora\\Online-eCommerce.csv', sep= ',')

#Tirando as células vazias do dataframe
dfe = dfe.dropna()
dfe.info()

# Ajustando o dataframe para popular a tabela de categorias, padrinizando para letras minúsculas e removendo os espaços a mais
categorias = dfe['Category'].str.lower()
categorias = categorias.str.strip()
# pegando somente a lista de ocorrencias unicas
categorias = categorias.unique()
categorias = pd.DataFrame(categorias)
categorias.columns = [ 'nome']
categorias.to_csv('categorias.csv')


# Limpando a tabela de produtos
dfe['Product']= dfe['Product'].str.lower()
dfe['Product']= dfe['Product'].str.strip()
# retirando os valores duplicados para obter apenas as ocorrencias unicas para popular a base
produtos = dfe[['Product', 'Cost']].drop_duplicates(subset=['Product'], ignore_index=True)
# Transformando o nome das colunas para o mesmo padrão proposto do exercício
produtos.columns = ['nome', 'preco']
produtos.to_csv('produtos.csv')

# Ajustando os valores para a tabela Produtos Categorias
dfe_unique = dfe.copy()
dfe_unique = dfe_unique[['Product', 'Category']].drop_duplicates(subset=['Product'], ignore_index=True)
dfe_unique['Category']=dfe_unique['Category'].str.lower()

# Salvando em uma variável as ocorrencias de categoria e produtos para poder transformar em id únicos
lista_categorias = dfe_unique['Category'].unique()
lista_podutos = dfe_unique['Product'].unique()



dfe_unique.drop_duplicates(inplace=True, ignore_index=True)


#Transformando os nomes nos ids
dfe_unique = dfe_unique.replace(to_replace=lista_categorias, value=[0,1,2,3,4,5,6,7,8,9,10,11])

dfe_unique.head(20)

#Criando uma lista de ids seriados para os produtos
listin = []
for i in range(len(lista_podutos)):
    listin.append(i)
# Confirmando os tamanos da lista com a quantidade de produtos para ter certeza do código
print(len(listin))
print(len(lista_podutos))

# Aplicando o mesmo algoritmo das categorias para os produtos
dfe_unique = dfe_unique.replace(to_replace=lista_podutos, value=listin)


dfe_unique.columns = ['produto_id', 'categoria_id']


dfe_unique.to_csv('produtos_categoria.csv', columns=['produto_id', 'categoria_id'])


