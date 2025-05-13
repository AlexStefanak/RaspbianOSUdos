#!/bin/bash

echo "=== Vytváram používateľské účty ==="

# Admin účtu (sudopráva)
sudo useradd -m adminserver -s /bin/bash
echo "adminserver:admin123" | sudo chpasswd
sudo usermod -aG sudo adminserver

# Web správca
sudo useradd -m webadmin -s /bin/bash
echo "webadmin:web123" | sudo chpasswd

echo "=== Účty adminserver a webadmin boli vytvorené ==="
