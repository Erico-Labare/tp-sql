SET SQL_SAFE_UPDATES = 0;

DELETE FROM compo
WHERE ID_BON IN(
SELECT ID FROM bon
WHERE DATE_CMDE BETWEEN '2019-04-01' AND '2019-04-30');

DELETE FROM bon
WHERE DATE_CMDE BETWEEN '2019-04-01' AND '2019-04-30';