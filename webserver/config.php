<?php
$host = 'localhost';
$db   = 'webapp';
$user = 'webuser';
$pass = 'webpass';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    echo "Chyba spojenia s DB: " . $e->getMessage();
    exit();
}
?>
