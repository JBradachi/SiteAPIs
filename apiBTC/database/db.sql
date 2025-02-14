SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Garante que a comunicação entre o banco de dados e o backend se dará na
-- codificação correta. Não remova essa linha sob hipótese alguma!

SET CHARACTER_SET_CLIENT = utf8;
SET CHARACTER_SET_CONNECTION = utf8;
SET CHARACTER_SET_RESULTS = utf8;
SET COLLATION_CONNECTION = utf8_general_ci;

-- Criação do banco de dados ---------------------------------------------------

CREATE SCHEMA IF NOT EXISTS mysqlsite DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS mysqlsite.TB_bitcoin (
  valor DECIMAL NOT NULL,
  volume DECIMAL NOT NULL,
  variacao DECIMAL NOT NULL,
  tempo VARCHAR(50) NOT NULL,
  PK_id INTEGER NOT NULL auto_increment,
  PRIMARY KEY (PK_id))
ENGINE = InnoDB;

-- Inserção de dados iniciais --------------------------------------------------

USE mysqlsite

-- Configurações finais --------------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;