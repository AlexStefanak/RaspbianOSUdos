<?php
require 'config.php';

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$_POST["username"]]);
    $user = $stmt->fetch();

    if ($user && $_POST["password"] == $user["password"]) {
        $_SESSION["user"] = $user["username"];
        header("Location: success.php");
    } else {
        echo "❌ Neplatné prihlasovacie údaje.";
    }
}
?>

<form method="post">
    Používateľské meno: <input type="text" name="username" required><br>
    Heslo: <input type="password" name="password" required><br>
    <input type="submit" value="Prihlásiť">
</form>
