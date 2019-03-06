/*
Req 4
On cherche les codes permanents, noms et prénoms des étudiants inscrits aux cours dont:
- les sigles commencent par les lettres 'INF',
- enseignés par le professeur dont le nom est 'De Vinci'
- des sessions 32003 ou 12004
- ces étudiants sont considérés n’avoir pas abandonné le cours durant cette session
*/
SELECT
    INSCRIPTION.CODEPERMANENT, ETUDIANT.NOM AS NOMETUDIANT,
    ETUDIANT.PRENOM AS PRENOMETUDIANT, INSCRIPTION.SIGLE
FROM
    INSCRIPTION, GROUPECOURS, PROFESSEUR, ETUDIANT
WHERE
    INSCRIPTION.SIGLE LIKE 'INF%'
AND
    (INSCRIPTION.CODESESSION = '32003' OR INSCRIPTION.CODESESSION = '12004')
AND
    PROFESSEUR.NOM = 'De Vinci'
AND
    INSCRIPTION.CODEPERMANENT = ETUDIANT.CODEPERMANENT
AND
    INSCRIPTION.SIGLE = GROUPECOURS.SIGLE
AND
    INSCRIPTION.CODESESSION = GROUPECOURS.CODESESSION
AND
    INSCRIPTION.NOGROUPE = GROUPECOURS.NOGROUPE
AND
    GROUPECOURS.CODEPROFESSEUR = PROFESSEUR.CODEPROFESSEUR
AND
    INSCRIPTION.DATEABANDON IS NULL;
