USE Papyrus2;
DELETE FROM produit; 
INSERT INTO produit(CODART, LIBART, STKALE, STKPHY, QTEANN, UNIMES)
    VALUE 
    ("I100", "Papier 1 ex continu", 100, 557, 3500, "B1000"),
    ("I105", "Papier 2 ex continu", 75, 5, 2300, "B1000"),
    ("I108", "Papier 3 ex continu", 200, 557, 3500, "B500"),
    ("I110", "Papier 4 ex continu", 10, 12, 63, "B400"),
    ("P220", "Pré imprimé commande", 500, 2500, 24500, "B500"),
    ("P230", "Pré imprimé facture", 500, 250, 12500, "B500"),
    ("P240", "Pré imprimé bulletin paie", 500, 3000, 6250, "B500"),
    ("P250", "Pré imprimé bon livraison", 500, 2500, 24500, "B500"),
    ("P270", "Pré imprimé bon fabrication", 500, 2500, 24500, "B500"),
    ("R080", "Ruban Epson 850", 10, 2, 120, "unité"),
    ("R132", "Ruban imp 1200 lignes", 25, 200, 182, "unité"),
    ("B002", "Bande manétiques 6250", 20, 12, 410, "unité"),
    ("B001", "Bande manétiques 1200", 20, 12, 410, "unité"),
    ("D035", "CD R slim 80 mm", 40, 42, 150, "B010"),
    ("D050", "CD R-W 80 mm", 50, 4, 0, "B010");
DELETE FROM fournis;
INSERT INTO fournis(NUMFOU, NOMFOU, RUEFOU, POSFOU, VILFOU, CONFOU, SATISF)
    VALUE
    (00120,"GROBRIGAN","20 rue du papier","92200","papercity","Georges",08),
    (00540,"ECLIPSE","53 rue laisse flotter les rubans","78250","Bugbugville","Nestor",07),
    (08700,"MEDICIS","120 rue des plantes","75014","Paris","Lison",NULL),
    (09120,"DISCOBOL","11 rue des sports","85100","La Roche sur Yon","Hercule",08),
    (09150,"DEPANPAP","26 avenue des locomotives","59987","Coroncountry","Pollux",05),
    (09180,"HURRYTAPE","68 boulevard des octets","04044","Dumpville","Track",NULL);
DELETE FROM ligcom;
INSERT INTO ligcom(NUMLIG, QTECDE, PRIUNI, QTELIV, DERLIV, NUMCOM, CODART)
    VALUE
    (01,3000,"470",3000,"15/03/2007",70010,"I100"),
    (02,2000,"485",2000,"07/07/2007",70010,"I105"),
    (03,1000,"680",1000,"20/08/2007",70010,"I108"),
    (04,200,"40",200,"20/02/2007",70010,"D035"),
    (05,6000,"3500",6000,"31/03/2007",70010,"P220"),
    (06,6000,"2000",2000,"31/03/2007",70010,"P240"),
    (01,1000,"600",1000,"16/05/2007",70011,"I105"),
    (01,200,"140",NULL,"31/12/2007",70020,"B001"),
    (02,200,"140",NULL,"31/12/2007",70020,"B002"),
    (01,1000,"590",1000,"15/05/2007",70025,"I100"),
    (02,500,"590",500,"15/05/2007",70025,"I105"),
    (01,1000,"470",1000,"15/07/2007",70210,"I100"),
    -- (02,10000,"3500",10000,"31/08/2007",70010,"P220"),
    (01,50,"790",50,"31/10/2007",70300,"I110"),
    (01,15000,"4900",12000,"15/12/2007",70250,"P230"),
    (02,10000,"3350",10000,"10/11/2007",70250,"P220"),
    (01,1000,"470",1000,"15/10/2007",70625,"I100"),
    (01,200,"600",200,"01/11/2007",70620,"I105"),
    (02,10000,"3500",10000,"31/10/2007",70625,"P220");
    -- ATTENTION EN TROP
    -- (01,200,"140",NULL,"31/12/2007",70629,"B001"),
    -- (02,200,"140",NULL,"31/12/2007",70629,"B002");
DELETE FROM entcom;
INSERT INTO entcom(NUMCOM,OBSCOM,DATCOM,NUMFOU)
    VALUE
    (70010,"","10/02/2007","00120"),
    (70011,"Commande urgente","01/03/2007","00540"),
    (70020,"","25/04/2007","09180"),
    (70025,"Commande urgente","30/04/2007","09150"),
    (70210,"Commande cadencée","05/05/2007","00120"),
    (70300,"","06/06/2007","09120"),
    (70250,"Commande cadencée","02/10/2007","08700"),
    (70620,"","02/10/2007","00540"),
    (70625,"","09/10/2007","00120"),
    (70629,"","12/10/2007","09180");
    -- cela ne fonctionne pas 
DELETE FROM vente;
LOAD DATA LOCAL INFILE '//Users//80010-70-09/Documents/SQL/Créer SQL/Papyrus//vente.csv'
INTO TABLE vente
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(NUMFOU,CODART,DELLIV,QTE1,PRIX1,QTE2,PRIX2,QTE3,PRIX3);