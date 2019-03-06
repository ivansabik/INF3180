/*
Req 8
Afficher la différence entre la moyenne des notes des cours donnés durant la session
dont le code est 32003 et ceux de la session dont le code est 12204.
*/
SELECT
    MOYENNE1, MOYENNE2, MOYENNE1-MOYENNE2 AS DIFF
FROM (
    SELECT
        ROUND(AVG(NOTE), 2) AS MOYENNE1
    FROM
        INSCRIPTION
    WHERE
        CODESESSION = '32003'
), (
    SELECT
         ROUND(AVG(NOTE), 2) AS MOYENNE2
    FROM
        INSCRIPTION
    WHERE
        CODESESSION = '12004'
);