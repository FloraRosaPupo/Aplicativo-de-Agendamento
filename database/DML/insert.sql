-- Inserir Perfis
INSERT INTO PERFIL (TIPO_PERFIL) VALUES 
('Administrador'),
('Usuário'),
('Moderador'),
('Convidado'),
('Assinante');

-- Inserir Usuários
INSERT INTO USUARIO (USER_NAME, EMAIL, SENHA, PERFIL_ID) VALUES
('Joao', 'joao@example.com', 'senha123', 1),
('Maria', 'maria@example.com', 'senha123', 2),
('Pedro', 'pedro@example.com', 'senha123', 3),
('Ana', 'ana@example.com', 'senha123', 4),
('Carlos', 'carlos@example.com', 'senha123', 5);

-- Inserir Dados de Usuários
INSERT INTO USUARIO_DADOS (RUA, CIDADE, CEP, TELEFONE, CPF, USUARIO_ID) VALUES
('Rua A', 'Cidade A', '12345-678', '1234-5678', '111.111.111-11', 1),
('Rua B', 'Cidade B', '22345-678', '2234-5678', '222.222.222-22', 2),
('Rua C', 'Cidade C', '32345-678', '3234-5678', '333.333.333-33', 3),
('Rua D', 'Cidade D', '42345-678', '4234-5678', '444.444.444-44', 4),
('Rua E', 'Cidade E', '52345-678', '5234-5678', '555.555.555-55', 5);

-- Inserir Tipos de Agendamentos
INSERT INTO TIPO_AGENDAMENTO (NOME) VALUES
('Consulta'),
('Reunião'),
('Evento Pessoal'),
('Aula'),
('Entrevista');

-- Inserir Agendamentos
INSERT INTO AGENDAMENTOS (NOME, DESCRICAO, DATA_AGENDAMENTO, HORA_INCIAL, HORA_FINAL, USUARIO_ID, TIPO_ID) VALUES
('Consulta Médica', 'Consulta de rotina', '2024-06-10 10:00:00', '10:00:00', '11:00:00', 1, 1),
('Reunião de Trabalho', 'Reunião semanal', '2024-06-11 14:00:00', '14:00:00', '15:00:00', 2, 2),
('Festa de Aniversário', 'Festa de aniversário do João', '2024-06-12 18:00:00', '18:00:00', '21:00:00', 3, 3),
('Aula de Inglês', 'Aula intermediária', '2024-06-13 09:00:00', '09:00:00', '10:30:00', 4, 4),
('Entrevista de Emprego', 'Entrevista para vaga de desenvolvedor', '2024-06-14 15:00:00', '15:00:00', '16:00:00', 5, 5);
