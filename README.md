# 🗽 ImmoRent NYC - Analytics Pipeline

![dbt](https://img.shields.io/badge/dbt-1.0-orange?style=flat&logo=dbt)
![BigQuery](https://img.shields.io/badge/Google_BigQuery-Ready-blue?style=flat&logo=google-cloud)
![CI/CD](https://github.com/geoffrey-prelium/dbt-airbnb-nyc/actions/workflows/dbt_integration.yml/badge.svg)

## 📖 Contexte du Projet

**ImmoRent NYC** est une agence immobilière fictive cherchant à optimiser ses investissements locatifs à New York.
Ce projet dbt transforme les données brutes des annonces Airbnb en insights exploitables pour répondre à la question : **Quels sont les quartiers les plus rentables ?**

## 🏗️ Architecture des Données

Le projet suit une architecture ELT moderne en 2 couches :

1.  **Staging (`stg_listings`)** :
    * Nettoyage des noms de colonnes (Anglais -> Français).
    * Gestion des valeurs nulles (Nuits minimum par défaut à 1).
    * Typage des données.

2.  **Marts (`mart_analyse_quartiers`)** :
    * Agrégation par Arrondissement (Manhattan, Brooklyn...).
    * Calcul des KPIs : Prix Moyen, Volume d'annonces, Prix Min/Max.
    * Focus métier : Identification des zones à fort rendement.

## 🛡️ Qualité & Tests

La fiabilité des données est garantie par des tests automatisés (CI/CD via GitHub Actions) :
* **Unicité :** Vérification des clés primaires (`id_logement`).
* **Intégrité :** Pas de valeurs nulles sur les champs critiques (Prix, Quartier).
* **Règles Métier :** Test personnalisé interdisant les prix négatifs ou nuls.

## 🚀 Comment reproduire ce projet ?

### Pré-requis
* Python 3.10+
* Compte Google Cloud (BigQuery)

### Installation
```bash
# 1. Cloner le repo
git clone [https://github.com/geoffrey-prelium/dbt-airbnb-nyc.git](https://github.com/geoffrey-prelium/dbt-airbnb-nyc.git)
cd dbt-airbnb-nyc

# 2. Installer les dépendances
python -m venv venv
source venv/bin/activate  # ou .\venv\Scripts\activate sur Windows
pip install dbt-bigquery

# 3. Configurer les accès
# Placez votre clé JSON GCP dans un fichier ou configurez votre profiles.yml
```

### Exécution
```bash
dbt deps
dbt seed
dbt run
dbt test
```

---
*Projet réalisé dans le cadre d'un Bootcamp intensif Analytics Engineering.*