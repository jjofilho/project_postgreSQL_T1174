# PARTE 1 DO PROJETO - Modelagem e normalização de bancos de dados relacionais

## MODELO MER - EXERCÍCIO 1

### 1 - Ainda sem fazer normalizações, apresente o modelo conceitual deste esboço oferecido pelo gestor, destacando atributos chaves e multivalorados, caso existam, e apresentando também a cardinalidade dos relacionamentos.

### Explicação: Foi utilizado o texto base para fazer um modelo conceitual simples, sem muitos detalhes e sem muito polimento para apenas servir de comunicação com o grupo e quais seriam os proximos passos, fazendo exatamente o que o texto propôs. Incluindo apenas a entidade associativa pelo fato do relacionamento muitos para muitos, o retângulo foi colocado para fins visuais, já que com apenas duas entidades ligadas a essa entidade associativa não é necessário o uso dele.
![Modelo Conceitual (MER)](https://github.com/user-attachments/assets/aa359ab8-1ba1-4693-8d68-dd45b2b30483)

## MODELO LÓGICO - EXERCÍCIO 2

### 2 - Agora apresente um modelo lógico que expresse as mesmas informações e relacionamentos descritos no modelo original, mas decompondo-os quando necessário para que sejam respeitadas as 3 primeiras formas normais. Destaque atributos chaves e multivalorados, caso existam, e apresente também a cardinalidade dos relacionamentos.

### Explicação: Com base no modelo conceitual foi destrinchado para o modelo lógico, com suas chaves estrangeiras e tipos de dados, com novas tabelas formadas. Criando alguns extras como a tabela Endereco. O modelo está normalizado com as 3 formas normais, eliminadno atributos multivalorados e dependências parciais, adicionando as cardinalidades nas devidas posições. Foi criado um "id_telefone" para otimização de consultas. O restante das tabelas e colunas é autoexplicativo.
![Modelo Lógico](https://github.com/user-attachments/assets/d4f4565a-d7df-446a-affa-e4b292b1c873)


# PARTE 2 DO PROJETO - Modelagem e normalização de bancos de dados relacionais
### OBS: foi usado um banco de dados de e-commerce para este exercício, arquivos na pasta csv

### 3 - Liste os nomes de todos os produtos que custam mais de 100 reais, ordenando-os primeiramente pelo preço e em segundo lugar pelo nome. Use alias para mostrar o nome da coluna nome como "Produto" e da coluna preco como "Valor". A resposta da consulta não deve mostrar outras colunas de dados.

### Explicação: Foi usado o select para selecionar as colunas preco e nome da tabela produto, com o alias de Valor e Produto respectivamente para melhor interpretação do BD. Foi colocado o WHERE para impor a condição de consultar apenas valores maiores que 5000 reais (adaptado por conta do banco de dados de e-commerce ter valores muito acima de 100 reias) e por fim ordenou os resultados da consulta primeiro do menor ao maior preço, depois por ordem alfabética com o ORDER BY.
![PARTE 2 - Exercício 3 resultado sql](https://github.com/user-attachments/assets/f5809fc3-58c0-47b5-ac97-bfb7583f3436)

### 4 - Liste todos os ids e preços de produtos cujo preço seja maior do que a média de todos os preços encontrados na tabela "produtos".

### Explicação: Foi usado o select para selecionar as colunas id (que foi renomeado para id_produto para evitar confusões durante a consulta) e preco da tabela produto. Foi colocado o WHERE para impor a condição de consultar apenas valores maiores que a média dos preços dos produtos e por fim ordenou os resultados da consulta em ordem crescente com o ORDER BY.
![PARTE 2 - Exercício 4 resultado sql](https://github.com/user-attachments/assets/30b08cee-a96f-48b3-a674-d98840817324)

### 5 - Para cada categoria, mostre o preço médio do conjunto de produtos a ela associados. Caso uma categoria não tenha nenhum produto a ela associada, esta categoria não deve aparecer no resultado final. A consulta deve estar ordenada pelos nomes das categorias.

### Explicação: Foi usado o select para selecionar a coluna ca.nome (nome das categorias) e fazer uma média de cada categoria com o AVG, foram usados os alias categoria e media para melhor interpretação das colunas, select from seleciona a tabela produto e com o auxílio dos INNER JOIN selecionam também as tabelas produtos_categorias e categorias, As tabelas são combinadas usando INNER JOIN para ligar os produtos às suas categorias. Os resultados foram agrupados pelo GRUOP BY que agrupa os resultados pela categoria e por fim ordenou os resultados da consulta em ordem alfabética (asc) com o ORDER BY.
![PARTE 2 - Exercício 5 resultado sql](https://github.com/user-attachments/assets/e604a5d8-07a0-485e-9861-923f29f57bc7)

# PARTE 3 DO PROJETO - Inserções, alterações e remoções de objetos e dados em um banco de dados postgres

### 6 - Com o objetivo de demonstrar o seu conhecimento através de um exemplo contextualizado com o dia-a-dia da escola, utilize os comandos do subgrupo de funções DDL para construir o banco de dados simples abaixo, que representa um relacionamento do tipo 1,n entre as entidades "aluno" e "turma":

### Explicação: As tabelas foram criadas com base no texto apresentado, se adequando aos tipos de dados do pgadmin.
### Tabela aluno
![PARTE 3 - Exercício 6 resultado ](https://github.com/user-attachments/assets/603f0db3-a6ac-4b2f-a3a9-9bb82ea56af3)

### Tabela Turma 
![PARTE 3 - Exercício 6 resultado2 ](https://github.com/user-attachments/assets/be6b2c41-2296-42b4-9f4a-82ddfdd25cd7)

### 7 - Agora que você demonstrou que consegue ser mais do que um simples usuário do banco de dados, mostre separadamente cada um dos códigos DML necessários para cumprir cada uma das etapas a seguir:

#### a - Inserir pelo menos duas turmas diferentes na tabela de turma;

### Explicação: Foram feitas várias inserções simples com o INSERT INTO e a mesma lógica se seguiu para as questões b e c, apenas inserções.
![PARTE 3 - Exercício 6 resultado2 ](https://github.com/user-attachments/assets/862d626f-c48a-438c-922e-e5cd4b49d72c)

#### b - Inserir pelo menos 1 aluno alocado em cada uma destas turmas na tabela aluno (todos com NULL na coluna aluno_alocado);

#### c - Inserir pelo menos 2 alunos não alocados em nenhuma turma na tabela aluno (todos com NULL na coluna aluno_alocado);

#### d - Atualizar a coluna aluno_alocado da tabela aluno, de modo que os alunos associados a uma disciplina recebam o valor True e alunos não associdos a nenhuma disciplina recebam o falor False para esta coluna.

### Explicação: Foi utilizado o UPDATE para atualizar a tabela aluno, fazendo uam condição para o valor de aluno_alocado ser não nulo e ser true, caso o contrário (se for nulo) será falso.
![PARTE 3 - Exercício 7b,c,d resultado ](https://github.com/user-attachments/assets/1c58a8ad-807e-4d11-8abf-3149c79937e3)

