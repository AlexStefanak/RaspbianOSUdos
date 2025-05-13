#!/bin/bash

WEB_DIR="/var/www/html"

echo "=== Nasadzujem jednoduchú PHP + JS webovú aplikáciu ==="

# Odstráni starý index
sudo rm -f "$WEB_DIR/index.html"

# Vytvorí nový index
echo "<!DOCTYPE html>
<html>
<head>
    <title>Moja Web Aplikácia</title>
    <script>
        function zobrazCas() {
            document.getElementById('cas').innerText = new Date().toLocaleString();
        }
    </script>
</head>
<body onload='zobrazCas()'>
    <h1>Vitaj na webovom serveri!</h1>
    <p>Aktuálny čas: <span id='cas'></span></p>
    <p>Dátum zo servera (PHP): <?php echo date('d.m.Y H:i'); ?></p>
</body>
</html>" | sudo tee "$WEB_DIR/index.php" > /dev/null

echo "=== Webová aplikácia nasadená na: http://<IP_RASPBERRY_PI> ==="
