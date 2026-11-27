-- CONSULTAS E PESQUISAS, INCLUINDO FILTROS, ORDENAÇÕES, RELACIONAMENTOS OU OPERAÇÕES EQUIVALENTES

USE db_teamwave;

-- Visualizar todos os usuários.
SELECT *
FROM tb_usuario;

-- Visualizar somente nome, e-mail e telefone dos usuários.
SELECT nm_usuario, nm_email, cd_telefone
FROM tb_usuario;

-- Apresentar colunas com nomes personalizados.
SELECT
    nm_usuario AS 'Nome do usuário',
    nm_email AS 'E-mail',
    cd_telefone AS 'Telefone'
FROM tb_usuario;

-- Consultar os quadros e suas categorias.
SELECT nm_quadro, nm_categoria
FROM tb_quadro;

-- Consultar os quadros e os usuários que participam de cada quadro.
SELECT
    q.nm_quadro,
    u.nm_usuario,
    qp.dt_entrada
FROM tb_quadro_participante AS qp
INNER JOIN tb_quadro AS q
    ON qp.cd_quadro = q.cd_quadro
INNER JOIN tb_usuario AS u
    ON qp.cd_usuario = u.cd_usuario
ORDER BY q.nm_quadro, u.nm_usuario;

-- Consultar as tarefas e seus respectivos usuários responsáveis.
SELECT
    t.nm_tarefa,
    q.nm_quadro,
    u.nm_usuario AS 'Responsável'
FROM tb_tarefa_responsavel AS tr
INNER JOIN tb_tarefa AS t
    ON tr.cd_tarefa = t.cd_tarefa
    AND tr.cd_quadro = t.cd_quadro
INNER JOIN tb_quadro AS q
    ON tr.cd_quadro = q.cd_quadro
INNER JOIN tb_usuario AS u
    ON tr.cd_usuario = u.cd_usuario
ORDER BY q.nm_quadro, t.nm_tarefa;

-- Listar somente os usuários com perfil de membro.
SELECT nm_usuario, nm_email, cd_perfil
FROM tb_usuario
WHERE cd_perfil = 2;

-- Consultar tarefas com prioridade alta ou urgente, que ainda não estejam concluídas.
SELECT nm_tarefa, cd_prioridade, cd_status
FROM tb_tarefa
WHERE cd_prioridade >= 3
    AND cd_status < 4;

-- Consultar tarefas que estejam "A Fazer" ou "Fazendo".
SELECT nm_tarefa, cd_status
FROM tb_tarefa
WHERE cd_status = 2
    OR cd_status = 3;

-- Consultar tarefas com prazo entre 26/11/2026 e 05/12/2026.
SELECT nm_tarefa, dt_prazo
FROM tb_tarefa
WHERE dt_prazo BETWEEN '2026-11-26 00:00:00' AND '2026-12-05 23:59:59';

-- Consultar tarefas com prazo fora do mês de dezembro de 2026.
SELECT nm_tarefa, dt_prazo
FROM tb_tarefa
WHERE dt_prazo NOT BETWEEN '2026-12-01 00:00:00' AND '2026-12-31 23:59:59';

-- Consultar tarefas com prioridade média, alta ou urgente.
SELECT nm_tarefa, cd_prioridade
FROM tb_tarefa
WHERE cd_prioridade IN (2, 3, 4);

-- Consultar tarefas com prazo vencido que ainda não foram concluídas.
SELECT
    nm_tarefa,
    dt_prazo,
    DATEDIFF(CURDATE(), dt_prazo) AS 'Dias em atraso'
FROM tb_tarefa
WHERE dt_prazo < NOW()
    AND cd_status < 4
ORDER BY dt_prazo ASC;

-- Usuários cujo nome começa com a letra A.
SELECT nm_usuario
FROM tb_usuario
WHERE nm_usuario LIKE 'A%';

-- Usuários cujo nome termina com a letra A.
SELECT nm_usuario
FROM tb_usuario
WHERE nm_usuario LIKE '%a';

-- Localizar mensagens que mencionam tarefas.
SELECT
    c.nm_conversa,
    u.nm_usuario AS 'Autor',
    m.ds_mensagem,
    m.dt_envio
FROM tb_mensagem AS m
INNER JOIN tb_conversa_participante AS cp
    ON m.cd_participante = cp.cd_participante
INNER JOIN tb_usuario AS u
    ON cp.cd_usuario = u.cd_usuario
INNER JOIN tb_conversa AS c
    ON cp.cd_conversa = c.cd_conversa
WHERE m.ds_mensagem LIKE '%tarefa%'
ORDER BY m.dt_envio DESC;

-- Localizar arquivos PDF enviados ao sistema, organizando por data de envio.
SELECT
    nm_arquivo,
    qt_tamanho_bytes,
    dt_envio
FROM tb_arquivo
WHERE nm_arquivo LIKE '%.pdf'
ORDER BY dt_envio DESC;

-- Ordenar os usuários em ordem alfabética crescente.
SELECT nm_usuario, nm_email
FROM tb_usuario
ORDER BY nm_usuario ASC;

-- Ordenar as tarefas pela prioridade decrescente e pelo prazo crescente.
SELECT nm_tarefa, cd_prioridade, dt_prazo
FROM tb_tarefa
ORDER BY cd_prioridade DESC, dt_prazo ASC;

-- Mostrar o tamanho dos arquivos em bytes e em kilobytes.
SELECT
    nm_arquivo,
    qt_tamanho_bytes AS 'Tamanho em bytes',
    ROUND(qt_tamanho_bytes / 1024, 2) AS 'Tamanho em KB'
FROM tb_arquivo;

-- Apresentar as coordenadas das empresas em uma única coluna.
SELECT
    nm_empresa,
    ds_empresa,
    CONCAT(vl_latitude, ', ', vl_longitude) AS 'Coordenadas'
FROM tb_empresa_mapa
ORDER BY nm_empresa;

-- Apresentar o espaço utilizado pelos arquivos, separado por contexto.
SELECT
    ca.nm_contexto AS 'Contexto do arquivo',
    CONCAT(FORMAT(SUM(a.qt_tamanho_bytes) / 1024, 2), ' KB') AS 'Espaço utilizado'
FROM tb_contexto_arquivo AS ca
INNER JOIN tb_arquivo AS a
    ON ca.cd_contexto_arquivo = a.cd_contexto_arquivo
GROUP BY ca.cd_contexto_arquivo, ca.nm_contexto
ORDER BY SUM(a.qt_tamanho_bytes) DESC;

-- Calcular quantos dias faltam para o prazo de cada tarefa.
SELECT
    nm_tarefa,
    dt_prazo,
    DATEDIFF(dt_prazo, CURDATE()) AS 'Dias até o prazo'
FROM tb_tarefa
ORDER BY dt_prazo;

-- Calcular quantos dias se passaram desde a criação de cada tarefa.
SELECT
    nm_tarefa,
    dt_criacao,
    DATEDIFF(CURDATE(), dt_criacao) AS 'Dias desde a criação'
FROM tb_tarefa;

-- Mostrar uma data de acompanhamento de sete dias depois do prazo.
SELECT
    nm_tarefa,
    dt_prazo,
    dt_prazo + INTERVAL '7' DAY AS 'Prazo acrescido de 7 dias'
FROM tb_tarefa;

-- Separar dia da semana, dia, nome do mês e ano.
-- Define o idioma das datas para Português do Brasil
SET lc_time_names = 'pt_BR';

SELECT
    nm_evento,
    dt_evento,
    DAYNAME(dt_evento) AS 'Dia da Semana',
    DAY(dt_evento) AS 'Dia',
	MONTHNAME(dt_evento) AS 'Nome do mês',
    YEAR(dt_evento) AS 'Ano'
FROM tb_evento;

-- Consultar os eventos com a menor e a maior data cadastrada.
SELECT
    nm_evento,
    dt_evento
FROM tb_evento
WHERE dt_evento = (SELECT MIN(dt_evento) FROM tb_evento)
    OR dt_evento = (SELECT MAX(dt_evento) FROM tb_evento)
ORDER BY dt_evento;

-- Contar a quantidade de usuários cadastrados.
SELECT COUNT(*) AS 'Total de usuários'
FROM tb_usuario;

-- Somar o tamanho de todos os arquivos em bytes.
SELECT SUM(qt_tamanho_bytes) AS 'Tamanho total em bytes'
FROM tb_arquivo;

-- Calcular o tamanho médio dos arquivos em bytes.
SELECT ROUND(AVG(qt_tamanho_bytes), 2) AS 'Tamanho médio em bytes'
FROM tb_arquivo;

-- Consultar a quantidade de tarefas cadastradas.
SELECT COUNT(*) AS 'Total de tarefas'
FROM tb_tarefa;

-- Consultar tarefas com o quadro, responsável, status e prioridade correspondentes, organizando por prazo. O LEFT JOIN mantém na consulta as tarefas que ainda não possuem responsável.
SELECT
    t.nm_tarefa,
    q.nm_quadro,
    u.nm_usuario AS 'Responsável',
    s.nm_status,
    p.nm_prioridade,
    t.dt_prazo
FROM tb_tarefa AS t
INNER JOIN tb_quadro AS q
    ON t.cd_quadro = q.cd_quadro
LEFT JOIN tb_tarefa_responsavel AS tr
    ON t.cd_tarefa = tr.cd_tarefa
    AND t.cd_quadro = tr.cd_quadro
LEFT JOIN tb_usuario AS u
    ON tr.cd_usuario = u.cd_usuario
INNER JOIN tb_status_tarefa AS s
    ON t.cd_status = s.cd_status
INNER JOIN tb_prioridade AS p
    ON t.cd_prioridade = p.cd_prioridade
ORDER BY t.dt_prazo;

-- Consultar mensagens, seus autores e suas conversas, organizando por data de envio.
SELECT
    c.nm_conversa,
    u.nm_usuario AS 'Autor',
    m.ds_mensagem,
    m.dt_envio
FROM tb_mensagem AS m
INNER JOIN tb_conversa_participante AS cp
    ON m.cd_participante = cp.cd_participante
INNER JOIN tb_usuario AS u
    ON cp.cd_usuario = u.cd_usuario
INNER JOIN tb_conversa AS c
    ON cp.cd_conversa = c.cd_conversa
ORDER BY m.dt_envio;

-- Consultar os quadros favoritados por cada usuário.
SELECT
    u.nm_usuario,
    q.nm_quadro,
    q.nm_categoria,
    qf.dt_favoritado
FROM tb_quadro_favorito AS qf
INNER JOIN tb_usuario AS u
    ON qf.cd_usuario = u.cd_usuario
INNER JOIN tb_quadro AS q
    ON qf.cd_quadro = q.cd_quadro
ORDER BY u.nm_usuario;

-- Consultar arquivos anexados às tarefas, incluindo o local em que cada arquivo foi anexado.
SELECT
    t.nm_tarefa,
    a.nm_arquivo,
    a.qt_tamanho_bytes,
    la.nm_local_anexo
FROM tb_tarefa_arquivo AS ta
INNER JOIN tb_tarefa AS t
    ON ta.cd_tarefa = t.cd_tarefa
INNER JOIN tb_arquivo AS a
    ON ta.cd_arquivo = a.cd_arquivo
INNER JOIN tb_local_anexo_tarefa AS la
    ON ta.cd_local_anexo = la.cd_local_anexo;

-- Consultar todos os quadros, inclusive os que não possuem tarefas.
SELECT
    q.nm_quadro,
    t.nm_tarefa
FROM tb_quadro AS q
LEFT JOIN tb_tarefa AS t
    ON q.cd_quadro = t.cd_quadro
ORDER BY q.nm_quadro;

-- Consultar somente os quadros que ainda não possuem tarefas.
SELECT
    q.nm_quadro
FROM tb_quadro AS q
LEFT JOIN tb_tarefa AS t
    ON q.cd_quadro = t.cd_quadro
WHERE t.cd_tarefa IS NULL;

-- Consultar todos os perfis e a quantidade de usuários de cada perfil, mesmo que algum perfil não tenha usuários.
SELECT
    p.nm_perfil,
    COUNT(u.cd_usuario) AS 'Total de usuários'
FROM tb_usuario AS u
RIGHT JOIN tb_perfil AS p
    ON u.cd_perfil = p.cd_perfil
GROUP BY p.cd_perfil, p.nm_perfil;

-- Consultar a quantidade de tarefas em cada combinação de status e prioridade. A consulta também apresenta combinações que ainda não possuem tarefas.
SELECT
    s.nm_status,
    p.nm_prioridade,
    COUNT(t.cd_tarefa) AS 'Quantidade de tarefas'
FROM tb_status_tarefa AS s
CROSS JOIN tb_prioridade AS p
LEFT JOIN tb_tarefa AS t
    ON t.cd_status = s.cd_status
    AND t.cd_prioridade = p.cd_prioridade
GROUP BY
    s.cd_status,
    s.nm_status,
    p.cd_prioridade,
    p.nm_prioridade
ORDER BY s.cd_status, p.cd_prioridade;

-- Contar quantas tarefas existem em cada status.
SELECT
    s.nm_status,
    COUNT(t.cd_tarefa) AS 'Total de tarefas'
FROM tb_status_tarefa AS s
LEFT JOIN tb_tarefa AS t
    ON s.cd_status = t.cd_status
GROUP BY s.cd_status, s.nm_status
ORDER BY s.cd_status;

-- Contar tarefas por quadro e mostrar somente quadros que possuem duas ou mais tarefas.
SELECT
    q.nm_quadro,
    COUNT(t.cd_tarefa) AS 'Total de tarefas'
FROM tb_quadro AS q
INNER JOIN tb_tarefa AS t
    ON q.cd_quadro = t.cd_quadro
GROUP BY q.cd_quadro, q.nm_quadro
HAVING COUNT(t.cd_tarefa) >= 2;

-- Contar as tarefas de cada usuário, inclusive quem ainda não recebeu tarefas.
SELECT
    u.nm_usuario,
    COUNT(tr.cd_tarefa) AS 'Total de tarefas'
FROM tb_usuario AS u
LEFT JOIN tb_tarefa_responsavel AS tr
    ON u.cd_usuario = tr.cd_usuario
GROUP BY u.cd_usuario, u.nm_usuario
ORDER BY COUNT(tr.cd_tarefa) DESC;

-- Consultar conversas com pelo menos 10 mensagens.
SELECT
    c.nm_conversa,
    COUNT(m.cd_mensagem) AS 'Total de mensagens'
FROM tb_conversa AS c
INNER JOIN tb_conversa_participante AS cp
    ON c.cd_conversa = cp.cd_conversa
INNER JOIN tb_mensagem AS m
    ON cp.cd_participante = m.cd_participante
GROUP BY c.cd_conversa, c.nm_conversa
HAVING COUNT(m.cd_mensagem) >= 10
ORDER BY COUNT(m.cd_mensagem) DESC;

-- Consultar tarefas cuja prioridade está acima da média de prioridade das tarefas cadastradas.
SELECT
    nm_tarefa,
    cd_prioridade
FROM tb_tarefa
WHERE cd_prioridade > (
    SELECT AVG(cd_prioridade)
    FROM tb_tarefa
);

-- Consultar os usuários que ainda não enviaram mensagens.
SELECT
    nm_usuario
FROM tb_usuario
WHERE cd_usuario NOT IN (
    SELECT cd_usuario
    FROM tb_conversa_participante
    WHERE cd_participante IN (
        SELECT cd_participante
        FROM tb_mensagem
    )
);

-- Consultar os nomes dos quadros que possuem tarefas com prioridade urgente.
SELECT
    nm_quadro
FROM tb_quadro
WHERE cd_quadro IN (
    SELECT cd_quadro
    FROM tb_tarefa
    WHERE cd_prioridade = 4
        AND cd_status < 4
);
