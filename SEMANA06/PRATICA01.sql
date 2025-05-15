-- ============================
-- ATIVA CONSTRAINTS DE CHAVE ESTRANGEIRA (SQLite)
-- ============================
PRAGMA foreign_keys = ON;

-- ============================
-- ESTRUTURA DAS TABELAS (DDL)
-- ============================

-- Tabela de livros
CREATE TABLE livro (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    ano INTEGER,
    categoria TEXT
);

-- Tabela de leitores
CREATE TABLE leitor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- Tabela de empréstimos
CREATE TABLE emprestimo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_livro INTEGER NOT NULL,
    id_leitor INTEGER NOT NULL,
    data_emprestimo DATE DEFAULT (DATE('now')),
    data_devolucao DATE,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_leitor) REFERENCES leitor(id)
);

-- ============================
-- INSERÇÃO DE DADOS (INSERT)
-- ============================

-- Livros
INSERT INTO livro (titulo, autor, ano, categoria) VALUES
('Estruturas de Dados em C', 'N. Wirth', 2008, 'Tecnologia'),
('Orgulho e Preconceito', 'Jane Austen', 1813, 'Literatura'),
('Dom Casmurro', 'Machado de Assis', 1899, 'Literatura'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Infantil'),
('Inteligência Artificial', 'Stuart Russell', 2021, 'Tecnologia');

-- Leitores
INSERT INTO leitor (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira', 'maria@email.com'),
('Carlos Mendes', 'carlos@email.com');

-- Empréstimos
INSERT INTO emprestimo (id_livro, id_leitor, data_emprestimo, data_devolucao) VALUES
(1, 1, '2025-05-10', NULL),  -- Ainda não devolvido
(2, 2, '2025-05-09', '2025-05-12'),
(4, 1, '2025-05-08', '2025-05-13');

-- ============================
-- CONSULTAS (SELECT)
-- ============================

-- 1. Todos os livros
SELECT * FROM livro;

-- 2. Livros emprestados e seus leitores
SELECT l.titulo, r.nome AS leitor, e.data_emprestimo
FROM emprestimo e
JOIN livro l ON e.id_livro = l.id
JOIN leitor r ON e.id_leitor = r.id;

-- 3. Livros não devolvidos
SELECT l.titulo, r.nome AS leitor
FROM emprestimo e
JOIN livro l ON e.id_livro = l.id
JOIN leitor r ON e.id_leitor = r.id
WHERE e.data_devolucao IS NULL;

-- 4. Quantidade de livros emprestados por leitor
SELECT r.nome, COUNT(*) AS total_emprestimos
FROM emprestimo e
JOIN leitor r ON e.id_leitor = r.id
GROUP BY r.nome;

-- 5. Livros da categoria "Tecnologia"
SELECT * FROM livro WHERE categoria = 'Tecnologia';

-- ============================
-- ATUALIZAÇÕES (UPDATE)
-- ============================

-- Corrigindo título do livro
UPDATE livro SET titulo = 'Estruturas de Dados com C' WHERE id = 1;

-- Simular devolução de um livro
UPDATE emprestimo SET data_devolucao = '2025-05-14' WHERE id = 1;

-- ============================
-- REMOÇÕES (DELETE)
-- ============================

-- Remover um empréstimo
DELETE FROM emprestimo WHERE id = 3;

-- Remover um leitor e observar impacto
-- (apenas funcionará com ON DELETE CASCADE se a tabela for alterada)
DELETE FROM leitor WHERE id = 3;

-- Verificar situação final
SELECT * FROM emprestimo;
SELECT * FROM leitor;
SELECT * FROM livro;