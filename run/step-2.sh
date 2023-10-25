#!/usr/bin/env bash

# Étape 2 - Vote
# Version de Python utilisée lors des développements : 3.11

cd ../vote || exit

# Installation des dépendances
pip install -r requirements.txt

# Lancement du serveur
gunicorn app:app \
     -b 0.0.0.0:8080 \
     --log-file - \
     --access-logfile - \
     --workers 4 \
     --keep-alive 0
