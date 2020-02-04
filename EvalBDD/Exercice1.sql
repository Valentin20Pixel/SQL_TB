DROP DATABASE IF EXISTS EvalBDD;
CREATE DATABASE EvalBDD;
USE EvalBDD;
CREATE TABLE client(
    cli_num INT NOT NULL,
    cli_nom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel VARCHAR(30),
    CONSTRAINT client_PK PRIMARY KEY (cli_num)
);
CREATE TABLE commande(
    com_num INT NOT NULL,
    cli_num INT,
    com_date DATETIME,
    com_obs VARCHAR(50),
    CONSTRAINT commande_PK PRIMARY KEY (com_num),
    CONSTRAINT command_client_FK FOREIGN KEY (cli_num) REFERENCES client(cli_num)
);
CREATE TABLE produit(
    pro_num INT NOT NULL,
    pro_libelle VARCHAR(50),
    pro_description VARCHAR(50),
    CONSTRAINT produit_PK PRIMARY KEY (pro_num)
);
CREATE TABLE est_compose(
    com_num INT NOT NULL,
    pro_num INT NOT NULL,
    est_qte INT,
    CONSTRAINT est_compose_PK PRIMARY KEY (com_num, pro_num),
    CONSTRAINT est_compose_commande_FK FOREIGN KEY (com_num) REFERENCES commande(com_num),
    CONSTRAINT est_compose_produit_FK FOREIGN KEY (pro_num) REFERENCES produit(pro_num)
);

INSERT INTO client(cli_num,cli_nom,cli_adresse,cli_tel)
VALUE (01,"Valentin","","");