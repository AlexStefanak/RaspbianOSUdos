<?php
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: login.php");
    exit();
}
echo "🎉 Vitaj, " . $_SESSION["user"] . "!";
?>
