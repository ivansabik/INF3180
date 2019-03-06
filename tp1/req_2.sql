/*
Req 2
On cherche les code et noms des professeurs, sans répétition, qui ont enseigné à la fois
les cours INF3180 et INF2110, durant la session dont le code est 12004. Aussi, les code
et noms des professeurs, sans répétition, qui ont enseigné les cours INF1130 ou INF1110,
durant la session dont le code est 32003
*/
SELECT
  DISTINCT(GROUPECOURS.CODEPROFESSEUR), PROFESSEUR.NOM, PROFESSEUR.PRENOM
FROM
  GROUPECOURS, PROFESSEUR
WHERE ((
    (SIGLE = 'INF3180' OR SIGLE = 'INF2110') AND
    CODESESSION = '12004'
) OR (
    (SIGLE = 'INF1130' OR SIGLE = 'INF1110') AND
    CODESESSION = '32003'
)) AND
  GROUPECOURS.CODEPROFESSEUR = PROFESSEUR.CODEPROFESSEUR;
