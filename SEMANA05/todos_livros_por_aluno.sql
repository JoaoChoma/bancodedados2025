SELECT L.titulo, E.data_emprestimo, E.data_devolucao
FROM Livro L
JOIN Emprestimo E ON L.ID = E.livro_id
WHERE E.aluno_id = 1;
