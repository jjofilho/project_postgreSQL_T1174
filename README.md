![Logo da Ada Tech Cursos](./LogoAdaCabecalho.png)

# PROJETO FINAL - BANCO DE DADOS - SANTANDER CODERS | ADA TECH
<p align="center">
   <img src="https://img.shields.io/static/v1?label=STATUS&message=%20CONLUÍDO&color=RED&style=for-the-badge" #vitrinedev/>
</p>

## Tópicos

- [Descrição do projeto](#descrição-do-projeto)

- [Requisitos](#requisitos)

- [Ferramentas utilizadas](#ferramentas-utilizadas)

- [Acesso ao projeto](#acesso-ao-projeto)

- [Colaboradores](#colaboradores)

## Descrição do projeto 

<p align="justify">

Santander Coders 2024 - Turma 1174

Projeto Final - Módulo Banco de Dados I

Este Projeto abrange os principais temas no gerenciamento de um banco de dados relacional:
1. MER | Modelo Entidade-Relacionamento | Modelagem Conceitual
2. Modelagem Relacional | Modelo de Dados Lógico
3. Modelo de Dados Físico
4. DDL | Data Definition Language
5. DML | Data Manipulation Language
6. DQL | Data Query Language
7. DTL | Data Transaction Language
8. CRUD | Create, Read, Update, Delete

</p>

## Requisitos

### 1. Modelagem e normalização de bancos de dados relacionais


Certo dia, um dos gestores do banco em que você trabalha como cientista de dados procurou você pedindo ajuda para projetar um pequeno banco de dados com o objetivo de mapear os clientes da companhia pelos diferentes produtos financeiros que eles contrataram.

O gestor explicou que o banco tinha uma grande quantidade de clientes e oferecia uma variedade de produtos financeiros, como cartões de crédito, empréstimos, seguros e investimentos. No entanto, eles estavam tendo dificuldades para entender quais produtos eram mais populares entre os clientes e como esses produtos estavam interagindo entre si.

Como ponto de partida, o gestor deixou claro que um cliente pode contratar vários produtos diferentes ao passo que um mesmo produto pode também estar associado a vários clientes diferentes e elaborou um rústico esboço de banco de dados com duas tabelas, da seguinte forma:

### Tabela 1.1

```
Nome da tabela: cliente
Colunas: codigo_cliente, nome_cliente, sobrenome_cliente, telefones_cliente, municipio_cliente, codigo_tipo_cliente, tipo_cliente
```

### Tabela 1.2

```
Nome da tabela: produto
Colunas: codigo_produto, nome_produto, descricao_produto, codigo_tipo_produto, tipo_produto, codigo_diretor_responsavel, nome_diretor_responsavel, email_diretor_responsavel
```

`Requisito 1` Ainda sem fazer normalizações, apresente o modelo conceitual deste esboço oferecido pelo gestor, destacando atributos chaves e multivalorados, caso existam, e apresentando também a cardinalidade dos relacionamentos.

`Requisito 2` Agora apresente um modelo lógico que expresse as mesmas informações e relacionamentos descritos no modelo original, mas decompondo-os quando necessário para que sejam respeitadas as 3 primeiras formas normais. Destaque atributos chaves e multivalorados, caso existam, e apresente também a cardinalidade dos relacionamentos.

## 2. Consultas SQL simples e complexas em um banco de dados relacional

Um exemplo de modelo de banco de dados com relacionamento muitos-para-muitos pode ser o de um e-commerce que tem produtos e categorias, onde um produto pode pertencer a várias categorias e uma categoria pode estar associada a vários produtos. Nesse caso, teríamos duas tabelas: "produtos" e "categorias", com uma tabela intermediária "produtos_categorias" para relacionar os produtos às suas categorias.

### Tabela 2.1
```bash
CREATE TABLE produtos 
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
);
```

### Tabela 2.2
```bash
CREATE TABLE categorias 
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
```

### Tabela 2.3
```bash
CREATE TABLE produtos_categorias 
(
    produto_id INTEGER REFERENCES produtos(id),
    categoria_id INTEGER REFERENCES categorias(id),
    PRIMARY KEY (produto_id, categoria_id)
);
```

Assim, usando o subconjunto da "structured query language" chamado de DQL, produza consultas PostgresSQL de modo a atender cada uma das seguintes solicitações:

`Requisito 3` Liste os nomes de todos os produtos que custam mais de 100 reais, ordenando-os primeiramente pelo preço e em segundo lugar pelo nome. Use alias para mostrar o nome da coluna nome como "Produto" e da coluna preco como "Valor". A resposta da consulta não deve mostrar outras colunas de dados.

`Requisito 4` Liste todos os ids e preços de produtos cujo preço seja maior do que a média de todos os preços encontrados na tabela "produtos".

`Requisito 5` Para cada categoria, mostre o preço médio do conjunto de produtos a ela associados. Caso uma categoria não tenha nenhum produto a ela associada, esta categoria não deve aparecer no resultado final. A consulta deve estar ordenada pelos nomes das categorias.

## 3. Inserções, alterações e remoções de objetos e dados em um banco de dados relacional

Você está participando de um processo seletivo para trabalhar como cientista de dados na Ada, uma das maiores formadoras do país em áreas correlatadas à tecnologia. Dividido em algumas etapas, o processo tem o objetivo de avaliar você nos quesitos Python, Machine Learning e Bancos de Dados. Ainda que os dois primeiros sejam o cerne da sua atuação no dia-a-dia, considera-se que Bancos de Dados também constituem um requisito importante e, por isso, esta etapa pode ser a oportunidade que você precisava para se destacar dentre os seus concorrentes, demonstrando um conhecimento mais amplo do que os demais.

`Requisito 6` Com o objetivo de demonstrar o seu conhecimento através de um exemplo contextualizado com o dia-a-dia da escola, utilize os comandos do subgrupo de funções DDL para construir o banco de dados simples abaixo, que representa um relacionamento do tipo 1,n entre as entidades "aluno" e "turma":

### Tabela 3.1
```
Nome da tabela: aluno
Colunas da tabela: id_aluno (INT), nome_aluno (VARCHAR), aluno_alocado (BOOLEAN), id_turma (INT)
```

### Tabela 3.2
```
Nome da tabela: turma
Colunas da tabela: id_turma (INT), código_turma (VARCHAR), nome_turma (VARCHAR)
```

`Requisito 7` Agora que você demonstrou que consegue ser mais do que um simples usuário do banco de dados, mostre separadamente cada um dos códigos DML necessários para cumprir cada uma das etapas a seguir:

`Requisito 7.a` Inserir pelo menos duas turmas diferentes na tabela de turma;

`Requisito 7.b` Inserir pelo menos 1 aluno alocado em cada uma destas turmas na tabela aluno (todos com NULL na coluna `aluno_alocado`);

`Requisito 7.c` Inserir pelo menos 2 alunos não alocados em nenhuma turma na tabela aluno (todos com NULL na coluna `aluno_alocado`);

`Requisito 7.d` Atualizar a coluna `aluno_alocado` da tabela aluno, de modo que os alunos associados a uma disciplina recebam o valor `True` e alunos não associdos a nenhuma disciplina recebam o valor `False` para esta coluna.

## Ferramentas utilizadas

![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

## Acesso ao projeto

Você pode [acessar à documentação de modelagem e ao código fonte do projeto](https://github.com/jjofilho/project_postgreSQL_T1174/).

## Colaboradores
| [<img src="https://avatars.githubusercontent.com/u/20822673?v=4" width=115> <br><sub>André Filipe</sub>](https://github.com/filipester) | [<img src="https://avatars.githubusercontent.com/u/60614096?v=4" width=115> <br><sub>Diogo Carvalho</sub>](https://github.com/Dogix11) | [<img src="https://avatars.githubusercontent.com/u/172111247?v=4" width=115><br><sub>Flanderson Prates</sub>](https://github.com/flandersonprates) | [<img src="https://avatars.githubusercontent.com/u/161227020?v=4" width=115><br><sub>Giovana Martins</sub>](https://github.com/rhapozita) |  [<img src="https://avatars.githubusercontent.com/u/170963236?s=400&u=a8c7f81bbb6eba3f775a6f5f65098aace7bbef9d&v=4" width=115><br><sub>João Oliveira</sub>](https://github.com/jjofilho) |
| :---: | :---: | :---: | :---: | :---: |
