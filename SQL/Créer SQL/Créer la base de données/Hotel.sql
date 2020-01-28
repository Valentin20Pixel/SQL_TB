DROP DATABASE IF EXISTS ph2ex2;
CREATE DATABASE Hotel;
USE Hotel;
CREATE TABLE Station(
	sta_num Int NOT NULL AUTO_INCREMENT,
    sta_nom Varchar(50),
    PRIMARY KEY (sta_num)
);
CREATE TABLE Hotel(
    hot_cap Int NOT null,
    hot_cat Varchar(50),
    hot_nom Varchar(50),
    hot_adr Varchar(50),
    hot_num Int NOT null UNIQUE,
    sta_num Int,
    PRIMARY KEY (hot_num),
    FOREIGN KEY (sta_num) REFERENCES Station(sta_num)
);
CREATE TABLE Chambre(
    cha_cap Int,
    cha_deg Int,
    cha_exp Varchar(50),
    cha_num Int NOT null UNIQUE,
    hot_num Int,
    PRIMARY KEY (cha_num),
    FOREIGN KEY (hot_num) REFERENCES Hotel(hot_num)
);
CREATE TABLE Client(
	cli_adr Varchar(50),
    cli_nom Varchar(50),
    cli_pre Varchar(50),
    cli_num Int NOT null AUTO_INCREMENT,
    PRIMARY KEY (cli_num)
);
CREATE TABLE Reservation(
	cha_num Int,
    cli_num Int,
    res_datd Int,
    res_datf Int,
    res_dat Int,
    res_mont Int,
    res_ptot Int,
    PRIMARY KEY (cli_num, cha_num),
    FOREIGN KEY (cha_num) REFERENCES Chambre(cha_num),
    FOREIGN KEY (cli_num) REFERENCES Client(cli_num)
    -- CONSTRAINT PK_RESER_CLICHA (cli_num, cha_num)
);
