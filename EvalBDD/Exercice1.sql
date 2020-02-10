-- Supprime la base de donnée EvalBDD si elle existe
DROP DATABASE IF EXISTS EvalBDD;
-- Création de la base de donnée
CREATE DATABASE EvalBDD;
-- Les commandes suivantes seront utilisée dans la base de donnée EvalBDD
USE EvalBDD;
-- Création d'une table 
CREATE TABLE client(
    cli_num INT AUTO_INCREMENT NOT NULL,
    cli_nom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel VARCHAR(30),
-- Déclarartion de la clé primaire du tableau
    CONSTRAINT client_PK PRIMARY KEY (cli_num)
);
-- Création d'une table 
CREATE TABLE commande(
    com_num INT AUTO_INCREMENT NOT NULL,
    cli_num INT,
    com_date DATETIME,
    com_obs VARCHAR(50),
-- Déclarartion de la clé primaire du tableau
    CONSTRAINT commande_PK PRIMARY KEY (com_num),
-- Déclarartion d'une clé étrangère
    CONSTRAINT command_client_FK FOREIGN KEY (cli_num) REFERENCES client(cli_num)
);
-- Création d'une table 
CREATE TABLE produit(
    pro_num INT AUTO_INCREMENT NOT NULL,
    pro_libelle VARCHAR(50),
    pro_description VARCHAR(50),
-- Déclarartion de la clé primaire du tableau
    CONSTRAINT produit_PK PRIMARY KEY (pro_num)
);
-- Création d'une table 
CREATE TABLE est_compose(
    com_num INT AUTO_INCREMENT NOT NULL,
    pro_num INT NOT NULL,
    est_qte INT,
-- Déclarartion de la clé primaire du tableau
    CONSTRAINT est_compose_PK PRIMARY KEY (com_num, pro_num),
-- Déclarartion des clés étrangères
    CONSTRAINT est_compose_commande_FK FOREIGN KEY (com_num) REFERENCES commande(com_num),
    CONSTRAINT est_compose_produit_FK FOREIGN KEY (pro_num) REFERENCES produit(pro_num)
);

INSERT INTO client(cli_num,cli_nom,cli_adresse,cli_tel)
VALUE (01,"Valentin","","");