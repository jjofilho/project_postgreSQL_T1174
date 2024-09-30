# PARTE 1 DO PROJETO - Entendimento, regras e modelagem do negócio

## MODELO ENTIDADE RELACIONAMENTO - MER

### 1 - Entendendo as entidades e os relacionamentos:
#### Observando o pedido proposto e com base nos conceitos do MER, buscamos primeiro entender as entidades existentes no problema. Foi-se determinado que existiam duas entidades para o negócio, sendo elas: **Cliente e Produtos Financeiros**. Do lado do cliente temos diversas características para determinar a persona e assim poder aprimorar a abordagem comercial. Dentro do nosso modelo, temos evidenciadas essas características através dos atributos: ***Nome, Sobrenome, cidade e telefone***, sendo esses atributos característicos de um cadastro de clientes; observa-se que que o telefone é um atributo multivalorado, ou seja, um cliente pode possuir diversos telefones e exatamente por isso dentro do modelo recebe o formato de uma **elipse** dentro de outra; além desses atributos do cadastro, temos os atributos Código do Cliente como o atributo que irá *diferenciar* cada cliente, pois um cliente pode possuir o mesmo nome que outro distinto, os famosos homônimos; por fim temos características para ajudar o time de negócios, para que em suas pesquisas consigam agrupar certas características e assim há a possibilidade de criar produtos financeiros mais atraídos para certos grupos, esses atributos evidenciados dentro do nosso modelo pelo tipo de cliente e o código do tipo de cliente.


#### Já do lado de Produtos temos os seguintes atributos característicos do produto:
1. Nome do Produto
2. Descrição do Produto
#### Que são atributos de um cadastro do produto, com a chave primária ***Código do Produto*** e por fim temos:
1.  Código do tipo do produto
    1. Tipo do Produto
    2. Descrição do Produto
2. Código do Diretor Responsável
    1. Nome do Diretor Responsável
    2. E-mail do Diretor Responsável
#### Como os atributos que fecham as características que um produto possuí, por parte do diretor temos aquele que é o responsável pelo produto financeiro, característico de um negócio onde se utiliza metodologias ágeis, reconhecido também como Product Owner. Já pelo lado do ***tipo do produto*** seguimos a mesma lógica do tipo do cliente, assim podendo melhorar os produtos ofertados associando um grupo de produtos a um grupo de clientes. 

#### Essas duas entidades se relacionam dentro do negócio através de um Contrato, onde um Cliente pode adquirir diversos produtos, ou seja assinar diversos contratos, e um produto pode ser adquirido por diversos clientes, sendo assim um mesmo produto tem diversos contratos. Exatamente por isso essa relação assume uma característica de uma ***ENTIDADE ASSOCIATIVA*** possuindo os seguintes atributos: 
1. Código do Cliente (Chave Estrangeira)
2. Código do Produto (Chave Estrangeira)
3. Valor do Contrato
4. Data do Contrato

#### Com um grande volume de produtos e clientes, característicos de um grande banco, otimizem as informações tanto na hora de uma busca dentro de um sistema de SAC, como também para a formalização do contrato, podendo assim automatizar cadastros e consultas posteriores. Temos então nosso modelo final representado na seguinte visão:

[![Modelo Conceitual (MER)](images/Parte 1 - Modelo Conceitual (MER).jpg)](https://github.com/jjofilho/project_postgreSQL_T1174/blob/e52c5d62d2b7f8634a532c1330474f62ac8ef3be/images/Parte%201%20-%20Modelo%20Conceitual%20(MER).jpg)

<p align= 'center'> Figura 1 - Modelo Entidade Relacionamento do Banco</p>

## MODELO LÓGICO - Avançando Conceitos

### 2 - Refinando o Modelo Conceitual

#### Entendendo como funciona o negócio e sesus relacionamentos, conseguimos aprimorar o modelo conceitual aplicando o modelo lógico para o nosso banco. Com isso temos para cada atributo o tipo de dado dele (inteiro, caracteres, numeros) com a quantidade de informações gravadas, os famosos bits. Essa atribuição da quantidade de memória que deverá ser alocada para cada informação, ajuda a otimizar a quantidade de hardware dedicado para o banco de dados, ajudando no cálculo caso seja necessário escalar horizontalmente de acordo com a entrada de novos clientes ou produtos. Além disso podemos visualizar exatamente o que seria chave primária, chave secundária.

#### Pelo mesmo modelo também temos a capacidade de aplicar o conceito de ***NORMALIZAÇÃO***, tal conceito possuí as três formas normais que possuem como característica principal otimizar o banco de dados para que se evite repetições excessivas de atributos, atributos que estão relacionados a mais de um dado ou que dependem de outros atributos além da chave estrangeira. Conceitualmente as 3FNs, otimizam a alocação de memória e a velocidade de consultas futuras, sendo extremamente importante em um mundo de recursos escassos, com alto custo com hardware. 

#### Respeitando as 3FNs, podemos notar que há a necessidade de dedicar uma tabela para telefone, um atributo multivalorado, com a cardinalidade (1,n), assim como precisamos criar a tabela de endereço que também possui características que podem ser utilizadas por diversos clientes. Com isso conseguimos, ao consultar a tabela clientes, apenas importar um código, respeitando a segunda forma normal. Também criamos a tabela tipo do cliente, para que não fique-se repetindo essa informação diversas vezes dentro do nosso banco de dados. O mesmo raciocínio se repete para o tipo de produto e diretor responsável. Já a nossa tabela e-mail segue a mesma proposta da tabela de Telefone. 

#### Assim temos o seguinte modelo lógico: 
![Modelo Lógico](images/Parte 1 - Modelo Lógico.jpg)
<p align= 'center'> Figura 2 - Modelo Lógico do Banco


# Limpeza, Criação de Tabelas no PgAdmin, popular e realizar consultas
#### Seguindo com os conceitos apresentados anteriormente partimos para a criação de um modelo físico, porém para simplificar, tabelas a partir da seguinte:

![produtos_categoria](images/produtos_categorias.png)

#### Para popular o banco de dados foi utilizado a seguinte base de dados: <url>https://www.kaggle.com/datasets/ayushparwal2026/online-ecommerce</url> e utilizamos o código em Python para a limpeza e adequação dos valores, nomes das colunas e as propriedades de unicidade de chaves primárias, estrangeiras e também para encontrar as quantidades de caracteres que deve-se colocar para os dados em VARCHAR. Foi-se utilizado a biblioteca Pandas para tal exercício.

#### Com o dataframe pronto, conseguimos atráves do PgAdmin importar nossa base de dados seguindo o caminho:
1. Selecionar a Tabela a ser populada
2. Importar/Export
3. Selecionar o caminho
4. Selecionar o Enconding para UTF-8
5. Marcar que há o Header no arquivo CSV
6. Selecionar as colunas que devem ser importadas para o banco de dados

![import](images/import.png)

#### A partir da tabela populada, abriu-se uma query para trabalhar as ***CONSULTAS***, usou-se o comando select para selecionar as colunas preco e nome da tabela produto, usando o 'as' para alterar a saída das colunas para Valor e Produto, respectivamente, para melhor interpretação do BD. Foi colocado o WHERE para impor a condição de consultar apenas valores maiores que 5000 reais (adaptado por conta do banco de dados de e-commerce ter valores muito acima de 100 reais proposto no trabalho) e por fim ordenou os resultados da consulta primeiro do menor ao maior preço, depois por ordem alfabética com o ORDER BY.

<p> Tabela 2 - Produtos acima de $5000</p>

![PARTE 2 - Exercício 3 resultado sql](https://github.com/user-attachments/assets/f5809fc3-58c0-47b5-ac97-bfb7583f3436)

#### Melhorando a consulta buscamos entender qual é o ticket médio dos nossos produtos e buscar aqueles que possuem um maior valor que essa média de preços. Para isso foi usado o select para selecionar as colunas id (que foi renomeado para id_produto para evitar confusões durante a consulta) e preco da tabela produto. Foi colocado o WHERE para impor a condição de consultar apenas valores maiores que a média dos preços dos produtos e por fim ordenou os resultados da consulta em ordem crescente com o ORDER BY. O resultado foi o seguinte:

<p> Tabela 2 - Produtos com valores acima da média</p>

![PARTE 2 - Exercício 4 resultado sql](https://github.com/user-attachments/assets/30b08cee-a96f-48b3-a674-d98840817324)

#### Relacionando as três tabelas existentes conseguimos obter uma outra importante informação: a média dos valores para cada uma das 12 categorias existentes no nosso banco de dados, essa informação é extremamente importante para podermos entender quais são as categorias que possuem produtos com maiores médias de preço. Para isso selecionamos as colunas e tabelas a serem usadas, através do ***SELECT*** e o ***FROM***, o comando ***INNER JOIN*** para agregar as tabelas, ***GROUP BY*** para agregar de acordo com a categoria e por fim o ***ORDER BY*** para ordenar nossas categorias de acordo com a ordem alfabética, gerando o seguinte resultado:

<p> Tabela 3 - Valores médios de cada categoria</p>

![PARTE 2 - Exercício 5 resultado sql](https://github.com/user-attachments/assets/e604a5d8-07a0-485e-9861-923f29f57bc7)

# Linguagem DDL e DML
### Para finalizar os conhecimentos adquiridos no módulo de banco de dados, finalizamos com um exercício básico de um CRUD. Para isso foi usado um novo banco de dados de alunos e turmas, o objetivo é simplificar o problema para um novo que seja mais acessível para todos. Com isso podemos mostrar como seria inserido, lido, modificado ou deletado dados do nosso banco de dados.  

#### Criação das tabelas Auno e Turmas utilizando a linguagem DDL
<p> Tabela 4 - Tabela Aulnos</p>

![PARTE 3 - Exercício 6 resultado ](https://github.com/user-attachments/assets/603f0db3-a6ac-4b2f-a3a9-9bb82ea56af3)

<p> Tabela 5 - Tabela Turmas</p>

![PARTE 3 - Exercício 6 resultado2 ](https://github.com/user-attachments/assets/be6b2c41-2296-42b4-9f4a-82ddfdd25cd7)

### DML 

#### Inserindo novas turmas na tabela turmas;

### Foram feitas várias inserções simples com o INSERT INTO e a mesma lógica se seguiu para as questões b e c, apenas inserções.
<p> Tabela 6 - Tabela Turmas atualizada</p>

![PARTE 3 - Exercício 6 resultado2 ](https://github.com/user-attachments/assets/862d626f-c48a-438c-922e-e5cd4b49d72c)

#### b - Inserir pelo menos 1 aluno alocado em cada uma destas turmas na tabela aluno (todos com NULL na coluna aluno_alocado);

#### c - Inserir pelo menos 2 alunos não alocados em nenhuma turma na tabela aluno (todos com NULL na coluna aluno_alocado);

#### d - Atualizar a coluna aluno_alocado da tabela aluno, de modo que os alunos associados a uma disciplina recebam o valor True e alunos não associdos a nenhuma disciplina recebam o falor False para esta coluna.

### Explicação: Foi utilizado o UPDATE para atualizar a tabela aluno, fazendo uam condição para o valor de aluno_alocado ser não nulo e ser true, caso o contrário (se for nulo) será falso.

<p> Tabela 7 - Banco de dados atualizado</p>

![PARTE 3 - Exercício 7b,c,d resultado ](https://github.com/user-attachments/assets/1c58a8ad-807e-4d11-8abf-3149c79937e3)

