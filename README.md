# Semestrálna práca: Webový server na Raspberry Pi

## Obsah

- Apache2 (web server)
- PHP (backend)
- MariaDB (databáza)
- JavaScript (frontend)
- Dva používatelia:
  - adminserver (má sudo)
  - webadmin (správca webu)

## Spustenie

1. Urobiť skripty spustiteľné:
```bash
chmod +x install_full_stack.sh setup_users.sh deploy_webapp.sh
```

2. Spustiť ich v tomto poradí:
```bash
./install_full_stack.sh
./setup_users.sh
./deploy_webapp.sh
```

3. Otvoriť stránku v prehliadači:
```
http://<IP_adresa_Pi>
```

## Prihlasovacie údaje

- **adminserver** / `admin123`
- **webadmin** / `web123`
