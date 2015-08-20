<?php
$hostname = "db";
$username = "user";
$password = "password";

try {
    $db = new PDO("mysql:host=$hostname;dbname=cakephp", $username, $password);
      echo "Connected to database";
}
catch(PDOException $e) {
    echo $e->getMessage();
}
?>
