# adds-initial-setup

## Description

Ce dépôt contient un script PowerShell permettant d’installer **Active Directory Domain Services (AD DS)** et de promouvoir automatiquement un serveur Windows en **contrôleur de domaine**.

Le script est destiné **exclusivement à un usage pédagogique** dans des environnements de laboratoire ou de formation.

---

## Objectif pédagogique

Ce script permet aux étudiants de comprendre et de pratiquer :

* l’installation du rôle **Active Directory Domain Services**
* la création d’une **nouvelle forêt Active Directory**
* la promotion d’un serveur en **Domain Controller (DC)**
* l’installation et l’intégration du service **DNS**
* l’automatisation complète d’un déploiement AD via **PowerShell**

Il est conçu pour être exécuté sur un **serveur vierge dédié à la formation**.

---

## Contenu du dépôt

```text
adds-initial-setup/
├── install-adds-forest.ps1
└── README.md
```

---

## Prérequis

* Windows Server 2019 / 2022 / 2025
* Serveur **non membre d’un domaine existant**
* Accès administrateur local
* Connexion réseau fonctionnelle

---

## Domaine créé

Le script crée une **nouvelle forêt Active Directory** avec les paramètres suivants :

* **Domaine** :

```text
infoplus.lan
```

* **Nom NetBIOS** :

```text
INFOPLUS
```

* **DNS** : intégré à Active Directory

---

## Niveaux fonctionnels

Les niveaux fonctionnels utilisés sont volontairement fixés à :

```text
Domain Mode  : Windows Server 2012 R2
Forest Mode : Windows Server 2012 R2
```

Ce choix permet une **compatibilité maximale** avec les environnements de laboratoire et les scénarios pédagogiques.

---

## Actions effectuées par le script

Le script exécute les actions suivantes, **sans intervention utilisateur** :

1. Installation du rôle **Active Directory Domain Services**
2. Installation des outils d’administration AD
3. Création d’une nouvelle forêt Active Directory
4. Installation et configuration du service DNS
5. Promotion du serveur en contrôleur de domaine
6. Redémarrage automatique du serveur

---

## Mot de passe DSRM

Le mot de passe du **Directory Services Restore Mode (DSRM)** est défini directement dans le script.

⚠️ Ce choix est volontairement simplifié pour un **usage en laboratoire**.

---

## ⚠️ Avertissements importants

Ce script :

* transforme **définitivement** le serveur en contrôleur de domaine
* crée une **nouvelle forêt Active Directory**
* redémarre automatiquement le serveur à la fin de l’exécution
* ne propose aucun prompt ou confirmation
* ne prévoit aucun mécanisme de retour arrière

⚠️ **Une fois exécuté, le serveur ne peut plus être utilisé comme serveur membre standard.**

---

## Usage strictement pédagogique

Ce script est destiné :

* aux laboratoires étudiants
* aux environnements de test
* aux démonstrations et exercices Active Directory

❌ Il ne doit **en aucun cas** être utilisé en production ou sur un serveur contenant des données réelles.

---

## Exécution du script

1. Ouvrir **PowerShell en tant qu’administrateur**
2. Autoriser temporairement l’exécution des scripts si nécessaire :

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
```

3. Lancer le script :

```powershell
.\\install-adds-forest.ps1
```

---

## Licence

Usage pédagogique interne uniquement.
