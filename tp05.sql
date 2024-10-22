SELECT * 
FROM article
ORDER BY DESIGNATION ASC;

SELECT * 
FROM article
ORDER BY PRIX DESC;

SELECT *
FROM article
WHERE DESIGNATION LIKE 'Boulon%'
ORDER BY PRIX ASC;

SELECT *
FROM article
WHERE DESIGNATION LIKE '%sachet%'
ORDER BY PRIX ASC;

SELECT *
FROM article
WHERE UPPER(DESIGNATION) LIKE '%sachet%'
ORDER BY PRIX ASC;

SELECT article.*, fournisseur.NOM
FROM article
INNER JOIN fournisseur ON article.ID_FOU=fournisseur.ID
ORDER BY fournisseur.NOM ASC, article.PRIX DESC;

SELECT *
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE fournisseur.NOM = 'Dubois & Fils';

SELECT fournisseur.NOM, AVG(article.PRIX) AS MOYENNE
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE fournisseur.NOM = 'Dubois & Fils';

SELECT fournisseur.NOM, AVG(article.PRIX) AS MOYENNE
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
GROUP BY fournisseur.NOM

SELECT *
FROM bon
WHERE DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

SELECT DISTINCT compo.ID_BON
FROM compo
JOIN article ON compo.ID_ART=article.ID
WHERE article.DESIGNATION LIKE '%boulon%';


SELECT DISTINCT bon.ID, fournisseur.NOM
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE article.DESIGNATION LIKE '%boulon%';

SELECT compo.ID_BON, SUM(article.PRIX * compo.QTE) AS prix_total
FROM compo
JOIN article ON compo.ID_ART = article.ID
GROUP BY compo.ID_BON;

SELECT compo.ID_BON, SUM(compo.QTE) AS nombre_articles
FROM compo
GROUP BY compo.ID_BON;

SELECT compo.ID_BON, SUM(compo.QTE) AS nombre_articles
FROM compo
GROUP BY compo.ID_BON
HAVING nombre_articles > 25;

SELECT SUM(article.PRIX * compo.QTE) AS count_avril
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART=article.ID
WHERE MONTH(bon.DATE_CMDE) = 4 AND YEAR(bon.DATE_CMDE) = 2019;