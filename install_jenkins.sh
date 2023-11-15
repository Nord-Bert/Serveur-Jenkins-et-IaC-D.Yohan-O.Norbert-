#!/bin/bash

# Mise à jour des paquets
apt update

# Installation des dépendances nécessaires
sudo apt install -y openjdk-11-jdk wget

# Ajout du dépôt Jenkins et de la clé GPG
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | gpg --dearmor -o /usr/share/keyrings/jenkins-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/jenkins-archive-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Mise à jour des paquets après l'ajout du dépôt
apt update

# Installation de Jenkins
apt install -y jenkins

# Démarrage du service Jenkins
systemctl start jenkins

# Activation du démarrage automatique au boot
 systemctl enable jenkins

# Afficher le mot de passe initial pour déverrouiller Jenkins
echo "Le mot de passe initial pour Jenkins est:"
cat /var/lib/jenkins/secrets/initialAdminPassword

# Informations supplémentaires
echo "Jenkins est installé et en cours d'exécution."
echo "Accédez à l'interface web de Jenkins à l'adresse : http://localhost:8080"
echo "Veuillez suivre les instructions à l'écran pour terminer la configuration."
