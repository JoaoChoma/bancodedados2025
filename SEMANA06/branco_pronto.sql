-- Ativa constraints de chave estrangeira
PRAGMA foreign_keys = ON;

-- Tabela de clientes
CREATE TABLE cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    cidade TEXT
);

-- Tabela de produtos
CREATE TABLE produto (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL,
    categoria TEXT
);

-- Tabela de pedidos
CREATE TABLE pedido (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Tabela de itens dos pedidos
CREATE TABLE item_pedido (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER,
    id_produto INTEGER,
    quantidade INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- =============================
-- INSERÇÃO DE DADOS
-- =============================

-- Clientes
INSERT INTO cliente (nome, email, cidade) VALUES
('Alice Lima', 'alice@gmail.com', 'Curitiba'),
('Bruno Rocha', 'bruno@gmail.com', 'Londrina'),
('Carla Silva', 'carla@gmail.com', 'Curitiba'),
('Daniel Souza', 'daniel@gmail.com', 'Maringá');

-- Produtos
INSERT INTO produto (nome, preco, categoria) VALUES
('Notebook Dell', 4500.00, 'Informática'),
('Smartphone Samsung', 2500.00, 'Telefonia'),
('Smart TV LG', 3500.00, 'Eletrônicos'),
('Mouse Logitech', 150.00, 'Informática'),
('Fone JBL', 400.00, 'Áudio');

-- Pedidos
INSERT INTO pedido (id_cliente, data_pedido) VALUES
(1, '2025-04-01'),
(2, '2025-04-05'),
(1, '2025-04-10'),
(3, '2025-04-15');

-- Itens dos pedidos
INSERT INTO item_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),   -- Alice comprou 1 notebook
(1, 4, 2),   -- Alice comprou 2 mouses
(2, 2, 1),   -- Bruno comprou 1 smartphone
(3, 5, 1),   -- Alice comprou 1 fone
(4, 3, 1);   -- Carla comprou 1 TV