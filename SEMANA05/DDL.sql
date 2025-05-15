-- Tabela de Livros
CREATE TABLE Livro (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    ano_publicacao INTEGER
);

-- Tabela de Alunos
CREATE TABLE Aluno (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    matricula TEXT NOT NULL UNIQUE,
    data_nascimento DATE
);

-- Tabela de Empréstimos (relacionamento m:n)
CREATE TABLE Emprestimo (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    aluno_id INTEGER,
    livro_id INTEGER,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(ID),
    FOREIGN KEY (livro_id) REFERENCES Livro(ID)
);
