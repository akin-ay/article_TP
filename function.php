<?php
function bd(): PDO
{

    $dsn = 'mysql:dbname=mydb;host=127.0.0.1:3306';
    $user = 'root';
    $password = '';

    try {
        $pdo = new PDO($dsn, $user, $password);
        $pdo->exec('SET NAMES utf8');
        $pdo->setAttribute(
            PDO::ATTR_DEFAULT_FETCH_MODE,
            PDO::FETCH_ASSOC
        );

        return $pdo;
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }
}

function showarticle()
{
    $pdo = bd(); //recupere la B.D
    $sql = "select * from blog.article";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach ($result as $row) {
        echo "Article n°" . $row['idarticle'] . " : " . $row['titre'] . " <br /> ";
        echo "Description :" . $row['description'] . " <br /> ";
        echo "<br><br>";
    }
}

function showuser()
{
    $pdo = bd(); //recupere la B.D
    $sql = "select * from blog.utilisateur";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach ($result as $row) {

        echo "Utilisateur n°" . $row['idutilisateur'] . " : " . $row['nom'] . " " . $row['prenom'] . " <br /> ";
        echo "<br><br>";
    }
}


function nb_article()
{
    $pdo = bd();
    try {
        $sql = " select count(*) as nb from blog.article";

        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        $nb = "";
        foreach ($result as $row) {
            $nb = $row['nb'];
        }

        return $nb;
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }
}

function nb_article_user()
{
    $pdo = bd();
    $sql = "select count(*) as nb, utilisateur_idutilisateur as id, U.nom as nom from `blog`.`utilisateur` U left join `blog`.`article` A on U.idutilisateur=A.utilisateur_idutilisateur group by utilisateur_idutilisateur, u.nom;";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();

    foreach ($result as $row) {
        echo $row['id'] . " " . $row['nom'] . " - " . $row['nb'] . "<br />";
    }
}
