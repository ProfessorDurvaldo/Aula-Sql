-- ===========================================================================
--  MISTÉRIO EM MONTES CLAROS - Caderno de investigação
--  Aluno(a): ______________________________   Turma: ____________
-- ===========================================================================
--  Escreva aqui as consultas que for testando. Deixe também as que deram
--  errado! Elas mostram o seu raciocínio e valem tanto quanto as que acertaram.
--
--  Lembretes rápidos:
--    * data  -> tipo DATE, escreva '2018-01-15'
--    * hora  -> tipo TIME, escreva '16:00:00'
--    * altura em centímetros (1,70 m = 170)
--    * cpf e placa são texto, não número
--    * pessoa liga com renda pelo CPF, e com cnh pelo id_cnh
--
--  Estilo: escreva o NOME COMPLETO da tabela nas consultas, sem apelidos.
--    assim:  JOIN cnh ON cnh.id = pessoa.id_cnh
--    e não:  JOIN cnh h ON h.id = p.id_cnh
--  Dá mais trabalho de digitar, mas você lê a condição e entende na hora.
-- ===========================================================================

USE misterio_sql;


-- ---------------------------------------------------------------------------
-- RECONHECIMENTO
-- Antes de investigar, entenda o que existe. Rode e observe.
-- Dica: abra a aba DESIGNER do phpMyAdmin para ver o diagrama das relações.
-- ---------------------------------------------------------------------------

SELECT * FROM pessoa      LIMIT 10;
SELECT * FROM cnh         LIMIT 10;
SELECT * FROM entrevista  LIMIT 10;

-- Quantas linhas tem cada tabela? Onde tem mais informação?


-- ---------------------------------------------------------------------------
-- PASSO 1 - Achar o boletim de ocorrência do caso
-- Sabemos: assassinato, 15 de janeiro de 2018, Montes Claros.
-- ---------------------------------------------------------------------------

SELECT *
FROM boletim_ocorrencia
WHERE data = '2018-01-15'
  AND tipo = 'assassinato'
  AND cidade = 'Montes Claros';

-- >>> Leia a descrição com atenção. Ela indica DUAS testemunhas.
--     Anote o que você entendeu:
--     Testemunha 1: ______________________________________________
--     Testemunha 2: ______________________________________________


-- ---------------------------------------------------------------------------
-- PASSO 2 - Identificar a primeira testemunha
-- Dica: "último endereço de uma rua" = o MAIOR número daquela rua.
--       Pense em ORDER BY ... DESC combinado com LIMIT.
-- ---------------------------------------------------------------------------

-- escreva aqui:



-- ---------------------------------------------------------------------------
-- PASSO 3 - Identificar a segunda testemunha
-- Dica: o nome começa com algo conhecido -> operador LIKE.
--       Cuidado: há várias pessoas com esse nome na cidade. Use a rua também.
-- ---------------------------------------------------------------------------

-- escreva aqui:



-- ---------------------------------------------------------------------------
-- PASSO 4 - Ler o depoimento das duas testemunhas
-- Dica: a tabela entrevista guarda id_pessoa, não o nome. Você vai precisar
--       de um JOIN com pessoa (ou de uma subconsulta).
-- ---------------------------------------------------------------------------

-- escreva aqui:



-- ---------------------------------------------------------------------------
-- PASSO 5 - Cruzar as pistas para achar o assassino
-- São várias condições ao mesmo tempo, vindas de tabelas diferentes.
-- Monte POR PARTES e veja o número de linhas diminuir a cada condição:
-- ---------------------------------------------------------------------------

-- 5a) só a academia:


-- 5b) academia + o plano da sacola:


-- 5c) + a data em que a testemunha o viu treinando:


-- 5d) + a placa do carro (atenção ao curinga dos DOIS lados):



-- ---------------------------------------------------------------------------
-- PASSO 6 - Ler o depoimento do assassino
-- Ele não agiu sozinho. Anote as características de quem o contratou:
--     ______________________________________________________________
--     ______________________________________________________________
-- ---------------------------------------------------------------------------

-- escreva aqui:



-- ---------------------------------------------------------------------------
-- PASSO 7 - Encontrar o mandante
-- Aqui aparece o "três vezes". Contar quantas vezes algo aconteceu por pessoa
-- pede GROUP BY + COUNT(*); filtrar POR ESSA CONTAGEM pede HAVING.
-- E para pegar só dezembro de 2017: YEAR(data) e MONTH(data).
-- ---------------------------------------------------------------------------

-- escreva aqui:



-- ===========================================================================
-- BÔNUS - Investigação livre com o banco - 2 pontos
-- ===========================================================================

-- 1) Qual a renda anual do mandante? Ela está entre as 50 maiores da cidade?

-- 2) Quantos moradores cada rua tem? (GROUP BY endereco_rua)

-- 3) Qual foi o tipo de crime mais comum em 2017? Use YEAR(data).

-- 4) Qual evento teve mais check-ins na cidade?

-- 5) Qual a média de idade dos membros do plano ouro da academia?

-- 6) Quem são as pessoas sem CNH cadastrada?
--    Cuidado: o teste é IS NULL. Experimente "= NULL" e veja o que acontece.

-- 7) Em que DIA DA SEMANA a academia recebe mais gente? Use DAYNAME(data).
--    Confira: o dia 2018-01-09, citado no depoimento, era mesmo terça-feira?

-- 8) Qual a duração média de um treino? Use TIMEDIFF(hora_saida, hora_entrada).

-- 9) Qual o horário de pico da academia? Use HOUR(hora_entrada).

-- 10) Há quantos dias o membro mais antigo da academia está matriculado,
--     contando até a data do crime? Use DATEDIFF.
