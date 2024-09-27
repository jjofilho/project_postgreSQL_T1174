#Tabelas disponibilizadas pelo texto base para resolução das questões da parte 2
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos_categorias ( 
	produto_id INTEGER REFERENCES produtos(id),
    categoria_id INTEGER REFERENCES categorias(id),
    PRIMARY KEY (produto_id, categoria_id)
);

