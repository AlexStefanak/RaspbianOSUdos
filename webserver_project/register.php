<?php
require 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

    $stmt = $pdo->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    try {
        $stmt->execute([$username, $password]);
        echo "✅ Registrácia úspešná! <a href='login.php'>Prihlásiť sa</a>";
    } catch (Exception $e) {
        echo "⚠️ Chyba: " . $e->getMessage();
    }
}
?>

<form method="post">
    Používateľské meno: <input type="text" name="username" required><br>
    Heslo: <input type="password" name="password" required><br>
    <input type="submit" value="Registrovať">
</form>
