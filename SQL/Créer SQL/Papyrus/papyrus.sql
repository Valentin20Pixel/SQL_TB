USE Papyrus;
DROP TABLE produit;
CREATE TABLE produit(
    codart CHAR(4) NOT NULL,
    libart VARCHAR(30) NOT NULL,
    stkale INT(10) NOT NULL,
    stkphy INT(10) NOT NULL,
    qteann INT(10) NOT NULL,
    unimes CHAR(5) NOT NULL,
    PRIMARY KEY (codart)
);
DROP TABLE fournis;
CREATE TABLE fournis(
    numfou VARCHAR(25) NOT NULL,
    nomfou VARCHAR(25) NOT NULL,
    ruefou VARCHAR(50) NOT NULL,
    posfou CHAR(5) NOT NULL,
    vilfou VARCHAR(30) NOT NULL,
    confou VARCHAR(15) NOT NULL,
    satisf TINYINT(2),
    -- TINYINT(2)=0 à 10 TINYINT(3)=0 à 100 ETC...
    PRIMARY KEY (numfou)
);
DROP TABLE entcom;
CREATE TABLE entcom(
    numcom INT(10) AUTO_INCREMENT NOT NULL,
    obscom VARCHAR(50),
    datcom TIMESTAMP NOT NULL,
    numfou VARCHAR(25),
    PRIMARY KEY (numcom),
    FOREIGN KEY (numfou) REFERENCES fournis(numfou)
);
DROP TABLE ligcom;
CREATE TABLE ligcom(
    numlig TINYINT(3) NOT NULL,
    qtecde INT(10) NOT NULL,
    priuni VARCHAR(50) NOT NULL,
    qteliv INT(10),
    derliv DATE NOT NULL,
    numcom INT(10) NOT NULL,
    codart CHAR(4) NOT NULL,
    PRIMARY KEY (numlig, numcom),
    FOREIGN KEY (numcom) REFERENCES entcom(numcom),
    FOREIGN KEY (codart) REFERENCES produit(codart)
);
DROP TABLE vente;
CREATE TABLE vente(
    delliv SMALLINT(5),
    qte1 INT(10),
    prix1 VARCHAR(50),
    qte2 INT(10),
    prix2 VARCHAR(50),
    qte3 INT(10),
    prix3 VARCHAR(50),
    numfou VARCHAR(25),
    codart CHAR(4),
    PRIMARY KEY (numfou, codart),
    FOREIGN KEY (numfou) REFERENCES fournis(numfou),
    FOREIGN KEY (codart) REFERENCES produit(codart)
);