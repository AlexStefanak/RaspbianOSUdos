
# 🖥️ Semestrálna práca – Webový server na Raspberry Pi

Tento projekt slúži ako inštalátor webového servera na Raspberry Pi (Raspbian OS). Všetko prebieha pomocou shell skriptov cez príkazový riadok. Výsledkom je bežiaca webová aplikácia postavená na Apache, PHP a MariaDB.

---

## 📦 Čo projekt obsahuje

- Automatickú inštaláciu:
  - Apache2
  - PHP + MariaDB
  - git, curl
- Jednoduchú webovú aplikáciu v PHP + JavaScript
- Dvoch systémových používateľov:
  - `adminserver` (sudopráva)
  - `webadmin` (bez sudo)

---

## 🧰 Inštalácia na Raspberry Pi

### 1. 📥 Klonovanie repozitára

Na Raspberry Pi otvor terminál a zadaj:

```
git clone https://github.com/AlexStefanak/RaspbianOSUdos.git
cd RaspbianOSUdos
```

### 2. 🛠️ Nastavenie práv pre skripty

```
chmod +x install_full_stack.sh setup_users.sh deploy_webapp.sh
```

### 3. 🚀 Spustenie inštalácie softvéru

```
./install_full_stack.sh
```
Nainštaluje Apache2, PHP, MariaDB a nastaví root heslo databázy (`rootpassword`).

---

### 4. 👤 Vytvorenie používateľov

```
./setup_users.sh
```

Vytvoria sa používatelia:
- `adminserver` (heslo: `admin123`, má sudo)
- `webadmin` (heslo: `web123`, nemá sudo)

---

### 5. 🌐 Nasadenie webovej aplikácie

```
./deploy_webapp.sh
```

Webová aplikácia bude nasadená do:
```
/var/www/html/index.php
```

---

## 🌍 Ako otvoriť webserver

Zisti IP adresu Raspberry Pi:
```
hostname -I
```

A potom otvor v prehliadači:
```
http://<IP_adresa_tvojho_Pi>
```

---

## 🔐 Prihlasovacie údaje

| Účet          | Heslo     | Práva       |
|---------------|-----------|-------------|
| `adminserver` | `admin123`| sudo        |
| `webadmin`    | `web123`  | bez sudo    |

---

