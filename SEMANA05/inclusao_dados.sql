-- Inserir livros
INSERT INTO Livro (titulo, autor, ano_publicacao) VALUES ('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954);
INSERT INTO Livro (titulo, autor, ano_publicacao) VALUES ('1984', 'George Orwell', 1949);

-- Inserir alunos
INSERT INTO Aluno (nome, matricula, data_nascimento) VALUES ('João Silva', '12345', '2000-05-15');
INSERT INTO Aluno (nome, matricula, data_nascimento) VALUES ('Maria Oliveira', '67890', '1998-07-22');

-- Inserir empréstimos
INSERT INTO Emprestimo (data_emprestimo, data_devolucao, aluno_id, livro_id) VALUES ('2025-05-05', '2025-05-15', 1, 1);
INSERT INTO Emprestimo (data_emprestimo, data_devolucao, aluno_id, livro_id) VALUES ('2025-05-06', '2025-05-20', 2, 2);
