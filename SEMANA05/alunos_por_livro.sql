SELECT A.nome, E.data_emprestimo, E.data_devolucao
FROM Aluno A
JOIN Emprestimo E ON A.ID = E.aluno_id
WHERE E.livro_id = 1;
