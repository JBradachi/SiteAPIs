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
  PRIMARY KEY (PK_titulo))
ENGINE = InnoDB;


-- Configurações finais --------------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;