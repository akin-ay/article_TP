
<?php

include ("function.php");
?>
<h1>Adminisitration</h1>
<hr>

Nombre d'articles : <?php
$nb_article =nb_article();
echo $nb_article;
?>
<br>
Nombre d'article par utilisateur :
<br>
<?php nb_article_user();?>