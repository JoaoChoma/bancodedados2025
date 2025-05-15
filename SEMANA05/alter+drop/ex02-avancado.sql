-- ===========================
-- SISTEMA ACADÊMICO AVANÇADO
-- ===========================

-- Ativa suporte a foreign keys no SQLite
PRAGMA foreign_keys = ON;

-- ===========================
-- 1. TABELAS
-- ===========================

-- Tabela de cursos
CREATE TABLE curso (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    carga_horaria INTEGER NOT NULL,
    area TEXT,
    nivel TEXT
);

-- Tabela de alunos
CREATE TABLE aluno (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

-- Tabela de matrículas com exclusão em cascata
CREATE TABLE matricula (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    data_matricula DATE DEFAULT (DATE('now')),
    nota_final REAL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

-- ===========================
-- 2. INSERÇÃO DE DADOS
-- ===========================

-- Cursos
INSERT INTO curso (nome, carga_horaria, area, nivel) VALUES
('Python Básico', 60, 'Programação', 'Básico'),
('Banco de Dados', 80, 'TI', 'Intermediário'),
('Web Avançado', 100, 'Programação', 'Avançado');

-- Alunos
INSERT INTO aluno (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '(44) 99999-1111'),
('Maria Souza', 'maria@email.com', '(44) 99999-2222'),
('Pedro Costa', 'pedro@email.com', '(44) 99999-3333');

-- Matrículas
INSERT INTO matricula (id_aluno, id_curso, nota_final) VALUES
(1, 1, 9.0),
(2, 2, 8.5),
(3, 3, 7.0),
(1, 3, 10.0);  -- João faz dois cursos

-- ===========================
-- 3. CONSULTAS AVANÇADAS
-- ===========================

-- JOIN: Aluno, Curso e Nota
SELECT 
    a.nome AS aluno,
    c.nome AS curso,
    c.area,
    m.nota_final
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
JOIN curso c ON c.id = m.id_curso
ORDER BY aluno, curso;

-- Agrupamento: Média de notas por curso
SELECT 
    c.nome AS curso,
    ROUND(AVG(m.nota_final), 2) AS media_notas
FROM curso c
JOIN matricula m ON c.id = m.id_curso
GROUP BY c.nome;

-- Filtro: Alunos com nota final > 8
SELECT 
    a.nome AS aluno,
    c.nome AS curso,
    m.nota_final
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
JOIN curso c ON c.id = m.id_curso
WHERE m.nota_final > 8
ORDER BY m.nota_final DESC;

-- Atualização indireta: mudar nota para 10 em "Banco de Dados"
UPDATE matricula
SET nota_final = 10.0
WHERE id_curso = (SELECT id FROM curso WHERE nome = 'Banco de Dados');

-- ===========================
-- 4. TESTE DE EXCLUSÃO EM CASCATA
-- ===========================

-- Apagar aluno João (id = 1) e ver matrículas dele sumirem automaticamente
DELETE FROM aluno WHERE id = 1;

-- Verificar matrículas restantes
SELECT * FROM matricula;
