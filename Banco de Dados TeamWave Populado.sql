-- POPULAÇÃO DO BANCO DE DADOS TEAMWAVE

USE db_teamwave;

INSERT INTO tb_perfil (cd_perfil, nm_perfil) VALUES
(3, 'Convidado');

INSERT INTO tb_empresa_mapa
    (cd_empresa, nm_empresa, ds_empresa, vl_latitude, vl_longitude)
VALUES
(2, 'Agência Criativa Horizonte', 'Empresa fictícia de criação e comunicação visual.', -24.0048000, -46.4105000),
(3, 'Estúdio Ponto Digital', 'Empresa fictícia de desenvolvimento e tecnologia.', -24.0082000, -46.4141000),
(4, 'Consultoria Novos Caminhos', 'Empresa fictícia de planejamento e consultoria.', -24.0029000, -46.4160000),
(5, 'Núcleo de Pesquisa Aplicada', NULL, -24.0102000, -46.4093000);

INSERT INTO tb_usuario
    (cd_usuario, nm_usuario, nm_email, ds_hash_senha, cd_telefone, cd_cpf, dt_nascimento, cd_perfil)
VALUES
(1, 'Ana Souza', 'ana.souza@teamwave.com', SHA2('Ana@2026TW', 256), '(13) 90000-0001', '00000000001', '1998-04-12', 1),
(2, 'Bruno Lima', 'bruno.lima@teamwave.com', SHA2('Bruno#2026TW', 256), '(13) 90000-0002', '00000000002', '1999-08-23', 2),
(3, 'Carla Mendes', 'carla.mendes@teamwave.com', SHA2('Carla@2026TW', 256), '(13) 90000-0003', '00000000003', '2000-02-15', 2),
(4, 'Diego Martins', 'diego.martins@teamwave.com', SHA2('Diego#2026TW', 256), '(13) 90000-0004', '00000000004', '1997-11-07', 2),
(5, 'Elisa Ferreira', 'elisa.ferreira@teamwave.com', SHA2('Elisa@2026TW', 256), '(13) 90000-0005', '00000000005', '2001-06-30', 2),
(6, 'Felipe Rocha', 'felipe.rocha@teamwave.com', SHA2('Felipe#2026TW', 256), '(13) 90000-0006', '00000000006', '1996-01-19', 2),
(7, 'Gabriela Alves', 'gabriela.alves@teamwave.com', SHA2('Gabi@2026TW', 256), '(13) 90000-0007', '00000000007', '1998-09-14', 2),
(8, 'Henrique Costa', 'henrique.costa@teamwave.com', SHA2('Henrique#2026TW', 256), '(13) 90000-0008', '00000000008', '1997-03-26', 2),
(9, 'Isabela Ribeiro', 'isabela.ribeiro@teamwave.com', SHA2('Isa@2026TW', 256), '(13) 90000-0009', '00000000009', '2000-12-08', 2),
(10, 'João Pedro Nunes', 'joao.nunes@teamwave.com', SHA2('Joao#2026TW', 256), '(13) 90000-0010', '00000000010', '1999-05-17', 2),
(11, 'Mariana Costa', 'mariana.costa@teamwave.com', SHA2('Mariana@2026TW', 256), '(13) 90000-0011', '00000000011', '2001-07-22', 2),
(12, 'André Oliveira', 'andre.oliveira@teamwave.com', SHA2('Andre#2026TW', 256), '(13) 90000-0012', '00000000012', '1995-03-11', 2);

INSERT INTO tb_quadro
    (cd_quadro, nm_quadro, nm_categoria, cd_tipo_fundo, ds_cor_fundo, ds_url_fundo, im_fundo)
VALUES
(14, 'Capacitação', 'Equipe', 3, NULL, NULL, UNHEX('89504E470D0A1A0A0000000D4948445200000002000000020802000000FDD49A730000001649444154789C6374C8BBC3C0C0C0C4C0C0C0C0C0C000001206018E6BAACE060000000049454E44AE426082')),
(15, 'Atendimento', 'Operações', 1, '#D97706', NULL, NULL),
(16, 'Comunicação', 'Marketing', 2, NULL, 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1600&q=85', NULL);

-- Participantes associados a cada quadro.
INSERT INTO tb_quadro_participante (cd_quadro, cd_usuario, dt_entrada) VALUES
(1, 1, '2026-11-10 08:00:00'),
(1, 2, '2026-11-11 08:07:00'),
(1, 3, '2026-11-12 08:14:00'),
(1, 4, '2026-11-13 08:21:00'),
(1, 6, '2026-11-14 08:28:00'),
(2, 1, '2026-11-15 08:35:00'),
(2, 2, '2026-11-16 08:42:00'),
(2, 4, '2026-11-17 08:49:00'),
(2, 7, '2026-11-18 08:56:00'),
(2, 8, '2026-11-19 08:03:00'),
(3, 5, '2026-11-20 08:10:00'),
(3, 6, '2026-11-21 08:17:00'),
(3, 10, '2026-11-22 08:24:00'),
(3, 11, '2026-11-23 08:31:00'),
(4, 2, '2026-11-10 09:38:00'),
(4, 3, '2026-11-11 09:45:00'),
(4, 4, '2026-11-12 09:52:00'),
(4, 5, '2026-11-13 09:59:00'),
(4, 8, '2026-11-14 09:06:00'),
(5, 1, '2026-11-15 09:13:00'),
(5, 4, '2026-11-16 09:20:00'),
(5, 5, '2026-11-17 09:27:00'),
(5, 12, '2026-11-18 09:34:00'),
(6, 1, '2026-11-19 09:41:00'),
(6, 2, '2026-11-20 09:48:00'),
(6, 5, '2026-11-21 09:55:00'),
(6, 6, '2026-11-22 09:02:00'),
(6, 10, '2026-11-23 09:09:00'),
(7, 3, '2026-11-10 10:16:00'),
(7, 7, '2026-11-11 10:23:00'),
(7, 8, '2026-11-12 10:30:00'),
(7, 9, '2026-11-13 10:37:00'),
(8, 1, '2026-11-14 10:44:00'),
(8, 3, '2026-11-15 10:51:00'),
(8, 5, '2026-11-16 10:58:00'),
(8, 12, '2026-11-17 10:05:00'),
(9, 7, '2026-11-18 10:12:00'),
(9, 8, '2026-11-19 10:19:00'),
(10, 9, '2026-11-20 10:26:00'),
(10, 10, '2026-11-21 10:33:00'),
(11, 3, '2026-11-22 10:40:00'),
(11, 4, '2026-11-23 10:47:00'),
(12, 5, '2026-11-10 11:54:00'),
(12, 6, '2026-11-11 11:01:00'),
(13, 11, '2026-11-12 11:08:00'),
(13, 12, '2026-11-13 11:15:00'),
(14, 1, '2026-11-14 11:22:00'),
(14, 5, '2026-11-15 11:29:00'),
(15, 6, '2026-11-16 11:36:00'),
(15, 12, '2026-11-17 11:43:00'),
(16, 2, '2026-11-18 11:50:00'),
(16, 3, '2026-11-19 11:57:00'),
(16, 10, '2026-11-20 11:04:00');
INSERT INTO tb_quadro_favorito (cd_usuario, cd_quadro, dt_favoritado) VALUES
(1, 1, '2026-11-11 09:20:00'),
(1, 2, '2026-11-12 10:10:00'),
(1, 5, '2026-11-15 13:45:00'),
(1, 14, '2026-11-21 16:20:00'),
(2, 1, '2026-11-12 08:30:00'),
(3, 7, '2026-11-13 14:00:00'),
(3, 8, '2026-11-18 11:25:00'),
(4, 5, '2026-11-14 09:10:00'),
(6, 1, '2026-11-16 15:40:00'),
(6, 3, '2026-11-17 10:05:00'),
(6, 6, '2026-11-20 12:30:00'),
(7, 2, '2026-11-18 17:00:00'),
(8, 4, '2026-11-19 08:15:00'),
(9, 7, '2026-11-20 10:35:00'),
(9, 10, '2026-11-22 14:15:00'),
(10, 6, '2026-11-21 09:50:00'),
(12, 15, '2026-11-23 16:40:00');

INSERT INTO tb_tarefa
    (cd_tarefa, nm_tarefa, ds_tarefa, ds_detalhes, dt_criacao, dt_atualizacao, dt_prazo,
     qt_ordem, cd_quadro, cd_status, cd_prioridade)
VALUES
(1, 'Organizar cronograma do projeto', 'Definir as etapas e os prazos das atividades.', 'Separar as entregas por semana e conferir as dependências.', '2026-11-10 09:00:00', '2026-11-18 14:30:00', '2026-12-02 17:00:00', 1, 1, 3, 2),
(2, 'Revisar requisitos da plataforma', 'Conferir os requisitos funcionais e não funcionais.', 'Verificar se os requisitos estão claros e completos.', '2026-11-11 10:00:00', '2026-11-19 11:00:00', '2026-11-28 17:00:00', 2, 1, 4, 3),
(3, 'Criar identidade visual', 'Preparar elementos visuais para a campanha.', 'Definir cores, tipografia e aplicações da identidade.', '2026-11-12 08:30:00', '2026-11-20 16:00:00', '2026-12-05 17:00:00', 1, 4, 3, 3),
(4, 'Planejar publicações', 'Organizar os conteúdos das próximas semanas.', 'Montar calendário de publicações e revisar os textos.', '2026-11-13 13:00:00', '2026-11-13 13:00:00', '2026-12-08 17:00:00', 2, 4, 2, 2),
(5, 'Preparar apresentação', 'Montar a apresentação de acompanhamento do projeto.', 'Incluir objetivos, andamento, dificuldades e próximos passos.', '2026-11-14 09:30:00', '2026-11-21 10:15:00', '2026-12-01 18:00:00', 1, 5, 2, 4),
(6, 'Registrar decisões da reunião', 'Documentar as decisões tomadas pela equipe.', 'Organizar os tópicos e indicar os responsáveis.', '2026-11-15 15:00:00', '2026-11-17 09:20:00', '2026-11-22 17:00:00', 1, 6, 1, 1),
(7, 'Atualizar painel de tarefas', 'Conferir se as tarefas estão nas colunas corretas.', 'Verificar responsáveis, prioridades e prazos.', '2026-11-16 11:00:00', '2026-11-20 12:00:00', '2026-11-29 17:00:00', 2, 1, 3, 2),
(8, 'Pesquisar referências de design', 'Selecionar referências para a próxima etapa visual.', 'Guardar exemplos e explicar por que são relevantes.', '2026-11-17 14:00:00', '2026-11-17 14:00:00', '2026-12-06 17:00:00', 3, 7, 2, 1),
(9, 'Documentar o funcionamento dos quadros', 'Registrar como os quadros organizam as atividades.', 'Descrever as colunas, os responsáveis e as regras de movimentação das tarefas.', '2026-11-18 09:00:00', '2026-11-21 13:30:00', '2026-12-09 17:00:00', 1, 2, 2, 2),
(10, 'Validar permissões de acesso', 'Conferir as permissões dos diferentes perfis de usuário.', 'Testar o acesso às funções de gerenciamento e colaboração.', '2026-11-19 10:00:00', '2026-11-21 15:00:00', '2026-12-10 17:00:00', 1, 3, 3, 3),
(11, 'Revisar orçamento do projeto', 'Conferir os custos previstos e os valores recebidos.', NULL, '2026-11-12 09:00:00', '2026-11-22 15:00:00', '2026-11-22 17:00:00', 2, 6, 2, 4),
(12, 'Planejar treinamento da equipe', NULL, NULL, '2026-11-20 10:00:00', '2026-11-20 10:00:00', NULL, 1, 8, 1, 2),
(13, 'Analisar indicadores do projeto', 'Reunir os indicadores de produtividade e andamento.', 'Comparar os resultados com as metas definidas.', '2026-11-21 09:00:00', '2026-11-23 14:00:00', '2027-01-15 17:00:00', 1, 6, 3, 3),
(14, 'Validar publicação aprovada', 'Conferir a versão final antes da publicação.', 'Verificar texto, imagens e autorização.', '2026-11-10 11:00:00', '2026-11-19 16:00:00', '2026-11-19 17:00:00', 2, 7, 4, 4),
(15, 'Revisar materiais da campanha', 'Conferir os materiais antes de encaminhar para aprovação.', 'Verificar identidade visual, textos e formatos.', '2026-11-12 14:00:00', '2026-11-24 13:00:00', '2026-11-24 17:00:00', 2, 5, 3, 3),
(16, 'Aprovar texto institucional', 'Revisar a apresentação institucional da empresa.', 'Conferir clareza, ortografia e informações.', '2026-11-14 10:00:00', '2026-11-21 16:00:00', '2026-11-27 17:00:00', 3, 4, 4, 1),
(17, 'Levantar necessidades de suporte', 'Reunir solicitações recebidas pela equipe.', NULL, '2026-11-20 09:00:00', '2026-11-22 12:00:00', '2026-12-03 17:00:00', 1, 2, 2, 1),
(18, 'Atualizar documentação técnica', 'Registrar as alterações recentes da plataforma.', 'Reunir informações das últimas entregas.', '2026-11-18 13:00:00', '2026-11-23 17:00:00', '2026-12-12 17:00:00', 2, 1, 4, 2),
(19, 'Preparar relatório mensal', 'Consolidar resultados e indicadores do mês.', 'Comparar os dados com o período anterior.', '2026-11-19 08:45:00', '2026-11-23 15:20:00', '2026-12-04 17:00:00', 2, 5, 2, 4),
(20, 'Corrigir inconsistências do painel', 'Revisar dados e corrigir informações divergentes.', 'Conferir os cartões e os responsáveis.', '2026-11-17 11:00:00', '2026-11-22 18:00:00', '2026-11-26 17:00:00', 3, 6, 3, 1),
(21, 'Revisar identidade da campanha', 'Conferir os materiais visuais da campanha.', 'Validar os arquivos recebidos.', '2026-11-20 12:00:00', '2026-11-23 10:00:00', '2026-12-07 17:00:00', 1, 7, 2, 2),
(22, 'Organizar contatos de fornecedores', 'Atualizar os dados dos fornecedores.', NULL, '2026-11-21 10:00:00', '2026-11-21 10:00:00', NULL, 1, 3, 3, 2),
(23, 'Finalizar material de divulgação', 'Preparar a versão final dos materiais de divulgação.', 'Conferir o conteúdo aprovado.', '2026-11-18 09:00:00', '2026-11-24 16:00:00', '2026-12-15 17:00:00', 2, 4, 4, 4),
(24, 'Planejar integração de novos membros', 'Organizar as etapas de integração.', 'Definir orientações e materiais necessários.', '2026-11-22 09:00:00', '2026-11-24 11:00:00', '2026-12-03 17:00:00', 1, 8, 2, 4);

-- Responsáveis associados às tarefas, respeitando a participação no quadro.
INSERT INTO tb_tarefa_responsavel (cd_tarefa, cd_quadro, cd_usuario) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 4, 3),
(4, 4, 2),
(5, 5, 5),
(6, 6, 6),
(7, 1, 2),
(8, 7, 7),
(9, 2, 8),
(10, 3, 5),
(12, 8, 12),
(13, 6, 6),
(14, 7, 9),
(15, 5, 5),
(16, 4, 3),
(18, 1, 2),
(19, 5, 1),
(20, 6, 2),
(21, 7, 7),
(22, 3, 10),
(23, 4, 5),
(24, 8, 12);
INSERT INTO tb_checklist (cd_checklist, cd_tarefa, nm_item, ic_concluido, qt_ordem) VALUES
(1, 1, 'Listar etapas do projeto', 1, 1),
(2, 1, 'Definir responsáveis por etapa', 1, 2),
(3, 1, 'Estabelecer os prazos', 0, 3),
(4, 1, 'Revisar dependências', 0, 4),
(5, 2, 'Revisar requisitos funcionais', 1, 1),
(6, 2, 'Revisar requisitos não funcionais', 1, 2),
(7, 2, 'Conferir documentação final', 1, 3),
(8, 3, 'Definir paleta de cores', 1, 1),
(9, 3, 'Selecionar tipografia', 0, 2),
(10, 5, 'Criar estrutura dos slides', 1, 1),
(11, 5, 'Adicionar resultados', 0, 2),
(12, 5, 'Revisar apresentação', 0, 3),
(13, 9, 'Descrever colunas do quadro', 1, 1),
(14, 9, 'Registrar regras de movimentação', 0, 2),
(15, 10, 'Conferir permissões de gestor', 1, 1),
(16, 10, 'Conferir permissões de membro', 0, 2),
(17, 11, 'Conferir despesas previstas', 0, 1),
(18, 11, 'Comparar orçamentos recebidos', 0, 2),
(19, 15, 'Revisar imagens da campanha', 1, 1),
(20, 19, 'Reunir indicadores', 1, 1),
(21, 19, 'Preparar comparação mensal', 0, 2),
(22, 24, 'Definir materiais de integração', 0, 1);

INSERT INTO tb_comentario_tarefa
    (cd_comentario, cd_tarefa, cd_usuario, ds_comentario, dt_comentario)
VALUES
(1, 1, 2, 'O cronograma inicial já está organizado. Vou revisar os prazos.', '2026-11-18 15:00:00'),
(2, 1, 1, 'Também ajustei a ordem de duas entregas.', '2026-11-18 15:20:00'),
(3, 1, 2, 'A equipe confirmou as datas da primeira etapa.', '2026-11-19 09:10:00'),
(4, 2, 3, 'Encontrei dois requisitos que precisam de uma descrição mais detalhada.', '2026-11-19 11:30:00'),
(5, 3, 4, 'A primeira proposta da paleta de cores está pronta.', '2026-11-20 16:30:00'),
(6, 5, 1, 'Inclua também os próximos passos na apresentação.', '2026-11-21 10:30:00'),
(7, 6, 5, 'As decisões da reunião foram registradas no documento.', '2026-11-17 10:00:00'),
(8, 7, 6, 'Atualizei o painel e organizei as tarefas por prazo.', '2026-11-20 12:30:00'),
(9, 8, 7, 'Separei algumas referências que podem ajudar no design.', '2026-11-20 14:00:00'),
(10, 9, 8, 'A documentação dos quadros já está em revisão.', '2026-11-21 13:45:00'),
(11, 10, 9, 'As permissões do perfil de colaborador foram conferidas.', '2026-11-21 15:20:00'),
(12, 10, 10, 'Vou revisar também as permissões do perfil de gestor.', '2026-11-21 15:40:00'),
(13, 11, 2, 'O orçamento ainda precisa de conferência.', '2026-11-22 15:30:00'),
(14, 13, 6, 'Os indicadores foram reunidos para análise.', '2026-11-23 14:30:00'),
(15, 15, 5, 'Encontrei uma versão antiga de uma das imagens.', '2026-11-24 13:20:00'),
(16, 19, 12, 'Posso organizar os dados do mês anterior para comparação.', '2026-11-24 15:00:00'),
(17, 21, 7, 'A identidade está consistente com o material anterior.', '2026-11-24 16:10:00');

INSERT INTO tb_conversa (cd_conversa, nm_conversa, cd_tipo_conversa, dt_criacao) VALUES
(1, 'Equipe TeamWave', 2, '2026-11-10 08:00:00'),
(2, 'Ana e Elisa', 1, '2026-11-12 09:30:00'),
(3, 'Equipe de Marketing', 2, '2026-11-13 13:00:00'),
(4, 'Planejamento financeiro', 2, '2026-11-15 10:00:00'),
(5, 'Design e conteúdo', 2, '2026-11-18 14:00:00');

INSERT INTO tb_conversa_participante (cd_participante, cd_conversa, cd_usuario) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 6),
(6, 1, 7),
(7, 1, 8),
(8, 1, 9),
(9, 1, 10),
(10, 1, 11),
(11, 1, 12),
(12, 2, 1),
(13, 2, 5),
(14, 3, 2),
(15, 3, 3),
(16, 3, 4),
(17, 3, 9),
(18, 3, 10),
(19, 4, 2),
(20, 4, 5),
(21, 4, 6),
(22, 4, 12),
(23, 5, 1),
(24, 5, 7),
(25, 5, 8);

INSERT INTO tb_mensagem
    (cd_mensagem, cd_participante, cd_mensagem_resposta, ds_mensagem, ds_mensagem_citada, dt_envio, ic_fixada)
VALUES
(1, 1, NULL, 'Bom dia, equipe! Vamos revisar o cronograma do projeto hoje.', NULL, '2026-11-18 08:30:00', 1),
(2, 2, 1, 'Já comecei a conferir as etapas.', 'Bom dia, equipe! Vamos revisar o cronograma do projeto hoje.', '2026-11-18 08:35:00', 0),
(3, 3, NULL, 'Compartilhei a primeira versão da identidade visual.', NULL, '2026-11-18 09:10:00', 0),
(4, 4, 3, 'Vi o arquivo e deixei observações na tarefa de criação.', 'Compartilhei a primeira versão da identidade visual.', '2026-11-18 09:18:00', 0),
(5, 5, NULL, 'Anexei o relatório de andamento da equipe.', NULL, '2026-11-18 09:25:00', 0),
(6, 1, 5, 'Vou conferir os dados e retorno depois da reunião.', 'Anexei o relatório de andamento da equipe.', '2026-11-18 09:40:00', 0),
(7, 6, NULL, 'As tarefas de marketing já foram organizadas por campanha.', NULL, '2026-11-18 10:00:00', 1),
(8, 2, 7, 'Vou atualizar os responsáveis pelas tarefas.', 'As tarefas de marketing já foram organizadas por campanha.', '2026-11-18 10:08:00', 0),
(9, 7, NULL, 'Segue a planilha com o levantamento de referências.', NULL, '2026-11-18 10:20:00', 0),
(10, 4, 9, 'Recebi, vou conferir os dados antes da reunião.', 'Segue a planilha com o levantamento de referências.', '2026-11-18 10:28:00', 0),
(11, 2, NULL, 'Precisamos revisar as entregas desta semana.', NULL, '2026-11-18 11:00:00', 0),
(12, 3, 11, 'Já atualizei o quadro com as tarefas concluídas.', 'Precisamos revisar as entregas desta semana.', '2026-11-18 11:12:00', 0),
(13, 12, NULL, 'Oi, Elisa! Você conseguiu revisar os slides?', NULL, '2026-11-19 14:00:00', 0),
(14, 13, 13, 'Sim, fiz alguns ajustes e deixei os comentários no arquivo.', 'Oi, Elisa! Você conseguiu revisar os slides?', '2026-11-19 14:12:00', 0),
(15, 12, NULL, 'A apresentação precisa de mais um gráfico.', NULL, '2026-11-20 09:10:00', 0),
(16, 13, 15, 'Vou incluir o gráfico e enviar a nova versão.', 'A apresentação precisa de mais um gráfico.', '2026-11-20 09:25:00', 0),
(17, 14, NULL, 'Pessoal, a campanha será publicada na próxima semana.', NULL, '2026-11-20 10:00:00', 1),
(18, 15, 17, 'Vou revisar o texto antes de encaminhar.', 'Pessoal, a campanha será publicada na próxima semana.', '2026-11-20 10:15:00', 0),
(19, 16, NULL, 'A equipe de criação já enviou as imagens.', NULL, '2026-11-20 10:30:00', 0),
(20, 17, 19, 'Recebi os arquivos e vou conferir as dimensões.', 'A equipe de criação já enviou as imagens.', '2026-11-20 10:45:00', 0),
(21, 18, NULL, 'O calendário de publicações está atualizado.', NULL, '2026-11-20 11:00:00', 0),
(22, 14, 21, 'Ótimo, vou compartilhar o calendário com o restante da equipe.', 'O calendário de publicações está atualizado.', '2026-11-20 11:12:00', 0),
(23, 19, NULL, 'Consegui reunir os valores do orçamento.', NULL, '2026-11-21 09:00:00', 0),
(24, 21, 23, 'Vou comparar os valores com os custos previstos.', 'Consegui reunir os valores do orçamento.', '2026-11-21 09:12:00', 0),
(25, 20, NULL, 'Falta validar uma despesa antes de fechar o relatório.', NULL, '2026-11-21 09:25:00', 0),
(26, 19, 25, 'Vou verificar esse item com o financeiro.', 'Falta validar uma despesa antes de fechar o relatório.', '2026-11-21 09:40:00', 0),
(27, 24, NULL, 'Separei algumas referências para a nova campanha.', NULL, '2026-11-22 13:00:00', 0),
(28, 25, 27, 'Vou selecionar as imagens que combinam com a proposta.', 'Separei algumas referências para a nova campanha.', '2026-11-22 13:18:00', 0),
(29, 22, NULL, NULL, NULL, '2026-11-23 15:00:00', 0);

INSERT INTO tb_mensagem_favorito (cd_usuario, cd_mensagem, dt_favoritado) VALUES
(1, 1, '2026-11-18 09:00:00'),
(1, 3, '2026-11-18 09:30:00'),
(1, 7, '2026-11-20 10:30:00'),
(1, 17, '2026-11-20 10:20:00'),
(2, 1, '2026-11-18 09:05:00'),
(3, 3, '2026-11-18 09:40:00'),
(3, 11, '2026-11-18 11:20:00'),
(3, 17, '2026-11-20 10:25:00'),
(5, 14, '2026-11-19 14:30:00'),
(6, 5, '2026-11-18 09:45:00'),
(6, 24, '2026-11-21 09:20:00'),
(8, 9, '2026-11-18 10:40:00'),
(9, 19, '2026-11-20 10:55:00'),
(9, 21, '2026-11-20 11:20:00');

INSERT INTO tb_arquivo
    (cd_arquivo, nm_arquivo, ds_mime, qt_tamanho_bytes, im_conteudo, cd_contexto_arquivo, dt_envio)
VALUES
(1, 'cronograma_equipes.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', LENGTH(REPEAT(0x41, 28672)), REPEAT(0x41, 28672), 1, '2026-11-18 14:00:00'),
(2, 'requisitos_plataforma.pdf', 'application/pdf', LENGTH(REPEAT(0x42, 84210)), REPEAT(0x42, 84210), 1, '2026-11-19 10:00:00'),
(3, 'identidade_visual.png', 'image/png', LENGTH(REPEAT(0x43, 48700)), REPEAT(0x43, 48700), 1, '2026-11-20 16:00:00'),
(4, 'ata_reuniao.txt', 'text/plain', LENGTH(REPEAT(0x44, 1200)), REPEAT(0x44, 1200), 2, '2026-11-20 10:30:00'),
(5, 'briefing_campanha.pdf', 'application/pdf', LENGTH(REPEAT(0x45, 196608)), REPEAT(0x45, 196608), 2, '2026-11-21 09:00:00'),
(6, 'orcamento_projeto.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', LENGTH(REPEAT(0x46, 33280)), REPEAT(0x46, 33280), 1, '2026-11-21 11:00:00'),
(7, 'apresentacao_resultados.pdf', 'application/pdf', LENGTH(REPEAT(0x47, 153600)), REPEAT(0x47, 153600), 2, '2026-11-22 10:00:00'),
(8, 'referencias_design.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', LENGTH(REPEAT(0x48, 64000)), REPEAT(0x48, 64000), 2, '2026-11-22 11:00:00'),
(9, 'indicadores_mensais.csv', 'text/csv', LENGTH(REPEAT(0x49, 8192)), REPEAT(0x49, 8192), 1, '2026-11-23 13:00:00'),
(10, 'anexo_conversa.pdf', 'application/pdf', LENGTH(REPEAT(0x4A, 512000)), REPEAT(0x4A, 512000), 2, '2026-11-23 15:00:00');

INSERT INTO tb_tarefa_arquivo (cd_tarefa, cd_arquivo, cd_local_anexo) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(5, 6, 2),
(11, 9, 1),
(19, 1, 2),
(22, 6, 1);

INSERT INTO tb_mensagem_arquivo (cd_mensagem, cd_arquivo) VALUES
(5, 4),
(9, 5),
(17, 7),
(20, 8),
(29, 10);

INSERT INTO tb_evento
    (cd_evento, nm_evento, ds_evento, dt_evento, nm_tipo_evento, cd_usuario_responsavel, dt_criacao, dt_atualizacao)
VALUES
(1, 'Reunião de planejamento', 'Alinhar as próximas etapas e os responsáveis.', '2026-11-24 09:00:00', 'Reunião', 1, '2026-11-18 12:00:00', '2026-11-18 12:00:00'),
(2, 'Entrega da identidade visual', 'Apresentar a versão revisada da identidade visual.', '2026-11-27 14:00:00', 'Entrega', 3, '2026-11-19 15:00:00', '2026-11-20 10:00:00'),
(3, 'Revisão do cronograma', 'Conferir prazos e possíveis ajustes.', '2026-12-02 10:30:00', 'Tarefa', 1, '2026-11-20 09:00:00', '2026-11-20 09:00:00'),
(4, 'Apresentação do projeto', 'Apresentar o andamento do TeamWave.', '2026-12-05 15:00:00', 'Apresentação', 5, '2026-11-21 11:00:00', '2026-11-21 11:00:00'),
(5, 'Reunião de marketing', 'Definir o calendário de publicações.', '2026-12-08 13:30:00', 'Reunião', 2, '2026-11-21 14:00:00', '2026-11-21 14:00:00'),
(6, 'Revisão da documentação', 'Conferir a documentação dos quadros e das tarefas.', '2026-12-09 10:00:00', 'Reunião', 5, '2026-11-21 16:00:00', '2026-11-21 16:00:00'),
(7, 'Validação das permissões', 'Verificar os acessos dos perfis de usuário.', '2026-12-10 14:00:00', 'Tarefa', NULL, '2026-11-21 16:10:00', '2026-11-21 16:10:00'),
(8, 'Apresentação das referências', 'Compartilhar as referências selecionadas para o design.', '2026-12-11 09:30:00', 'Apresentação', 7, '2026-11-21 16:20:00', '2026-11-21 16:20:00'),
(9, 'Planejamento de conteúdo', 'Organizar os próximos conteúdos da equipe de marketing.', '2026-12-12 11:00:00', 'Reunião', 2, '2026-11-21 16:30:00', '2026-11-21 16:30:00'),
(10, 'Acompanhamento do projeto', 'Revisar o andamento geral das atividades.', '2026-12-14 15:00:00', 'Reunião', 1, '2026-11-21 16:40:00', '2026-11-21 16:40:00'),
(11, 'Revisão geral de resultados', NULL, '2027-01-20 10:00:00', NULL, NULL, '2026-11-24 09:00:00', '2026-11-24 09:00:00'),
(12, 'Reunião de integração', 'Apresentar os processos aos novos membros.', '2026-12-18 09:30:00', 'Integração', 12, '2026-11-24 10:00:00', '2026-11-24 10:00:00');

INSERT INTO tb_empresa_quadro (cd_empresa, cd_quadro) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 4),
(2, 7),
(3, 1),
(3, 8),
(4, 2),
(4, 6),
(4, 14),
(5, 3),
(5, 7),
(5, 15);
