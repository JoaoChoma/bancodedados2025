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