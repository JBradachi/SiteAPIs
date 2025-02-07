SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Garante que a comunicação entre o banco de dados e o backend se dará na
-- codificação correta. Não remova essa linha sob hipótese alguma!

SET CHARACTER SET utf8mb4;

-- Criação do banco de dados ---------------------------------------------------

CREATE SCHEMA IF NOT EXISTS mysqlsite DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS mysqlsite.TB_bitcoin (
  valor DECIMAL NOT NULL,
  volume DECIMAL NOT NULL,
  PK_tempo VARCHAR(50) NOT NULL,
  PRIMARY KEY (PK_tempo))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS mysqlsite.TB_noticia (
  PK_titulo VARCHAR(255) NOT NULL,
  data_postagem DATE NOT NULL,
  PRIMARY KEY (PK_titulo))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS mysqlsite.TB_patrocinadores (
  PK_nome_patrocinador VARCHAR(255) NOT NULL,
  nivel_patrocinador INT NOT NULL,
  PRIMARY KEY (PK_nome_patrocinador))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS mysqlsite.TB_publicacoes (
  PK_titulo VARCHAR(255) NOT NULL,
  local_publicacao VARCHAR(255) NOT NULL,
  ano_publicacao YEAR NOT NULL,
  autores VARCHAR(255) NOT NULL,
  PRIMARY KEY (PK_titulo))
ENGINE = InnoDB;


-- Inserção de dados iniciais --------------------------------------------------

USE mysqlsite

INSERT INTO TB_noticia (PK_titulo, data_postagem) 
  VALUES 
    ("MinasCoders no Pódio da Maratona Sydle Levty de Programação da SECOM", "2024-12-14"),
    ("Subgrupos do MinasCoders no SIPEEC", "2024-12-11"),
    ("MinasCoders Pesquisa no SIPEEC", "2024-12-10"),
    ("Equipes Selecionadas para a Semana Imersiva da Campus Mobile", "2024-12-09"),
    ("MinasCoders na Maratona de Programação da SECOM Jr.", "2024-12-03"),
    ("MinasCoders na Mostra de Profissões", "2024-11-26");

INSERT INTO TB_patrocinadores (PK_nome_patrocinador, nivel_patrocinador) 
  VALUES 
    ("SIDLE", 5),
    ("LEVTY", 5),
    ("HUB$", 4),
    ("Padaria do seu zé", 1);

INSERT INTO TB_publicacoes (PK_titulo, local_publicacao, ano_publicacao, autores) 
  VALUES 
    ("Mentoria em programação: aprendendo ao ensinar e ensinando ao aprender", "Anais do XV Women in Information Technology", "2021", "Maria Theresa Arruda Henriques"),
    ("Competições de programação para meninas do ensino médio: Afinal, era apenas uma questão de propósito", "Anais do XIV Women in Information Technology (WIT)", "2020", "Maria Dalila Vieira ");

-- Configurações finais --------------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;