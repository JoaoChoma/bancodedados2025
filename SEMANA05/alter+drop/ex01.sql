-- Habilitar suporte a foreign keys
PRAGMA foreign_keys = ON;

-- ========================
-- 1. CRIAÇÃO DAS TABELAS
-- ========================

-- Tabela de cursos
CREATE TABLE curso (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    carga_horaria INTEGER NOT NULL,
    area TEXT
);

-- Tabela de alunos
CREATE TABLE aluno (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

-- Tabela de matrículas com chaves estrangeiras
CREATE TABLE matricula (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    data_matricula DATE DEFAULT (DATE('now')),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

-- ========================
-- 2. INSERÇÃO DE DADOS
-- ========================

-- Cursos
INSERT INTO curso (nome, carga_horaria, area) VALUES
('Python Básico', 60, 'Programação'),
('Banco de Dados', 80, 'TI'),
('Web Avançado', 100, 'Programação');

-- Alunos
INSERT INTO aluno (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '(44) 99999-1111'),
('Maria Souza', 'maria@email.com', '(44) 99999-2222'),
('Pedro Costa', 'pedro@email.com', '(44) 99999-3333');

-- Matrículas
INSERT INTO matricula (id_aluno, id_curso) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 3);  -- João faz dois cursos

-- ========================
-- 3. ALTER TABLE
-- ========================

-- Adiciona coluna "nivel" à tabela curso
ALTER TABLE curso ADD COLUMN nivel TEXT;

-- Atualiza os níveis dos cursos
UPDATE curso SET nivel = 'Básico' WHERE nome = 'Python Básico';
UPDATE curso SET nivel = 'Intermediário' WHERE nome = 'Banco de Dados';
UPDATE curso SET nivel = 'Avançado' WHERE nome = 'Web Avançado';

-- Adiciona nota final à matrícula
ALTER TABLE matricula ADD COLUMN nota_final REAL;

-- Atribui notas fictícias
UPDATE matricula SET nota_final = 9.0 WHERE id = 1;
UPDATE matricula SET nota_final = 8.5 WHERE id = 2;
UPDATE matricula SET nota_final = 7.0 WHERE id = 3;
UPDATE matricula SET nota_final = 10.0 WHERE id = 4;

-- ========================
-- 4. CONSULTAS DE TESTE
-- ========================

-- Mostrar todos os alunos com seus cursos e notas
SELECT a.nome AS aluno, c.nome AS curso, m.nota_final
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
JOIN curso c ON m.id_curso = c.id;

