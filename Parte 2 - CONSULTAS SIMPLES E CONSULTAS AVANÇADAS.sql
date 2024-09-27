#Questão 3
SELECT preco as Valor, nome as Produto 
FROM produtos 
WHERE preco > 5000 
ORDER BY preco, nome;

#Questão 4
SELECT id as id_produto, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
ORDER BY id asc;

#Questão 5
SELECT ca.nome as categoria, AVG(preco) as media
FROM produtos pr
INNER JOIN produtos_categorias pc on pr.id = pc.produto_id
INNER JOIN categorias ca on ca.id = pc.categoria_id
GROUP BY ca.nome 
ORDER BY ca.nome asc;
