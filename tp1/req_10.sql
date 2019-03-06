/*
Req 10
Pour tous les cours qui ont une moyenne des notes supérieure ou égale à 80 pour la session
dont le code est 32003, mettre à jour la colonne dateFin de la table SessionUQAM en la mettant au 22 décembre 2003.
*/
UPDATE SESSIONUQAM
SET
    SESSIONUQAM.DATEFIN = '22/12/2003'
WHERE
    SESSIONUQAM.CODESESSION
IN (
    SELECT
        CODESESSION
    FROM (
        SELECT
            AVG(NOTE) AS MOYENNE, SIGLE, CODESESSION, NOGROUPE
        FROM
            INSCRIPTION
        WHERE
            CODESESSION = '32003'
        GROUP BY
            SIGLE, CODESESSION, NOGROUPE
    )
    WHERE
        MOYENNE >= 80
);