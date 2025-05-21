PRAGMA foreign_keys = ON;

-- Clientes
CREATE TABLE cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    cidade TEXT
);

-- Veículo (1:1 com cliente)
CREATE TABLE veiculo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER UNIQUE,
    modelo TEXT NOT NULL,
    placa TEXT UNIQUE NOT NULL,
    ano INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Serviços disponíveis
CREATE TABLE servico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT NOT NULL,
    preco REAL NOT NULL
);

-- Ordens de serviço (1:N com cliente)
CREATE TABLE ordem_servico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    data_abertura DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Itens executados na OS (1:N com ordem e 1:N com servico)
CREATE TABLE item_servico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_ordem INTEGER NOT NULL,
    id_servico INTEGER NOT NULL,
    quantidade INTEGER DEFAULT 1,
    FOREIGN KEY (id_ordem) REFERENCES ordem_servico(id),
    FOREIGN KEY (id_servico) REFERENCES servico(id)
);

-- ===============
-- Dados populados
-- ===============

-- Clientes
INSERT INTO cliente (nome, telefone, cidade) VALUES
('Carlos Mendes', '(43) 99999-1111', 'Londrina'),
('Ana Paula Souza', '(44) 98888-2222', 'Maringá'),
('João Ferreira', '(42) 97777-3333', 'Apucarana');

-- Veículos
INSERT INTO veiculo (id_cliente, modelo, placa, ano) VALUES
(1, 'Ford Ka', 'ABC-1234', 2015),
(2, 'Honda Civic', 'XYZ-5678', 2019),
(3, 'Chevrolet Onix', 'QWE-9090', 2020);

-- Serviços
INSERT INTO servico (descricao, preco) VALUES
('Troca de óleo', 150.00),
('Alinhamento e balanceamento', 200.00),
('Revisão completa', 600.00),
('Troca de pastilhas de freio', 300.00);

-- Ordens de serviço
INSERT INTO ordem_servico (id_cliente, data_abertura) VALUES
(1, '2025-05-01'),
(2, '2025-05-02'),
(1, '2025-05-10'),
(3, '2025-05-05');

-- Itens de serviço executados
INSERT INTO item_servico (id_ordem, id_servico, quantidade) VALUES
(1, 1, 1), -- Carlos - troca de óleo
(1, 2, 1), -- Carlos - alinhamento
(2, 3, 1), -- Ana - revisão completa
(3, 1, 1), -- Carlos - troca de óleo novamente
(3, 4, 1), -- Carlos - pastilhas de freio
(4, 2, 1); -- João - alinhamento