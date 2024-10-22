ALTER TABLE article ADD CONSTRAINT fk_article_fournisseur FOREIGN KEY (ID_FOU) REFERENCES fournisseur(ID);

ALTER TABLE bon ADD CONSTRAINT fk_bon_fournisseur FOREIGN KEY (ID_FOU) REFERENCES fournisseur(ID);

CREATE TABLE compo (ID_ART INT NOT NULL, ID_BON INT NOT NULL, QTE INT NOT NULL, PRIMARY KEY (ID_ART, ID_BON));

ALTER TABLE compo ADD CONSTRAINT fk_compo_article FOREIGN KEY (ID_ART) REFERENCES article(ID);

ALTER TABLE compo ADD CONSTRAINT fk_compo_bon FOREIGN KEY (ID_BON) REFERENCES bon(ID);



INSERT INTO fournisseur (ID, NOM) VALUES (1, 'Française d’Imports'), (2, 'FDM SA'), (3, 'Dubois & Fils');

INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) VALUES (1, 'A01', 'Perceuse P1', 74.99, 1), (2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2), (3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2), (4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3), (5, 'A02', 'Meuleuse 125mm', 37.85, 1), (6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.8, 3), (7, 'A03', 'Perceuse à colonne', 185.25, 1), (8, 'D04', 'Coffret mêches à bois', 12.25, 3), (9, 'F03', 'Coffret mêches plates', 6.25, 2), (10, 'F04', 'Fraises d’encastrement', 8.14, 2);



INSERT INTO bon (NUMERO, DATE_CMDE, DELAI, ID_FOU) VALUES ('ABCD1', CURDATE(), 3, 1);

INSERT INTO compo (ID_ART, ID_BON, QTE) VALUES(1, 1, 3), (5, 1, 4), (7, 1, 1);



