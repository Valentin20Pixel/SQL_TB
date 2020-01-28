DROP DATABASE IF EXISTS ph2ex1;
CREATE DATABASE ph2ex1;
USE ph2ex1;
CREATE TABLE personne(
    per_num Int AUTO_INCREMENT NOT NULL,
    per_nom Varchar(50),
    per_prenom Varchar(50),
    pre_adresse Varchar(50),
    per_ville Varchar(50),
    PRIMARY KEY (per_num)
);
CREATE TABLE groupe(
    gro_num Int AUTO_INCREMENT NOT NULL,
    gro_libelle Varchar(50),
    PRIMARY KEY (gro_num)
);
CREATE TABLE appartient(
    gro_num Int,
    per_num Int,
    PRIMARY KEY (gro_num, per_num),
    FOREIGN KEY (per_num) REFERENCES personne(per_num),
    FOREIGN KEY (gro_num) REFERENCES groupe(gro_num)
);