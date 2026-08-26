# FiveM MDT / CAD Integration — VAUNTCORP Tablet Resource

[![FiveM](https://img.shields.io/badge/FiveM-NUI%20resource-f40552)](https://fivem.net/)
[![License: MIT](https://img.shields.io/badge/License-MIT-22c55e.svg)](LICENSE)
[![VAUNTCORP MDT](https://img.shields.io/badge/VAUNTCORP-MDT%20%2F%20CAD-2563eb)](https://vauntcorp.com/)
[![Validate FiveM resource](https://github.com/vauntt/fivem-vaunt-mdt-cad-integration/actions/workflows/validate.yml/badge.svg)](https://github.com/vauntt/fivem-vaunt-mdt-cad-integration/actions/workflows/validate.yml)

Ressource FiveM gratuite qui affiche **VAUNTCORP MDT/CAD** dans une tablette NUI en jeu. Elle donne aux services de police, EMS et dispatch un accès rapide au MDT depuis leur serveur GTA RP.

> **English summary:** Free FiveM NUI tablet resource that opens VAUNTCORP MDT/CAD in-game for police, EMS and dispatch workflows on GTA RP servers.

[Découvrir le MDT GTA RP pour FiveM](https://vauntcorp.com/) · [Voir les fonctionnalités MDT/CAD](https://vauntcorp.com/features) · [Ouvrir la démo](https://mdt.vauntcorp.com/) · [Support Discord](https://discord.gg/66khxqRVvd)

<p align="center">
  <a href="https://vauntcorp.com/">
    <img src="https://vauntcorp.com/images/posters/hero.webp" alt="Interface VAUNTCORP MDT/CAD pour serveur FiveM GTA RP" width="960">
  </a>
</p>

## Ce que fait cette ressource

- ouvre et ferme le MDT avec **F1** ;
- affiche l'application VAUNTCORP MDT dans une interface NUI ;
- joue une animation de tablette et attache l'objet au personnage ;
- bloque les contrôles incompatibles pendant l'utilisation ;
- ferme proprement la tablette avec **Échap** ou le bouton inférieur ;
- fonctionne côté client, sans script serveur supplémentaire.

Cette ressource est le **client tablette FiveM**. Elle ne contient pas un backend MDT/CAD autonome : une connexion à l'application hébergée [VAUNTCORP MDT](https://mdt.vauntcorp.com/) est nécessaire.

## Prérequis

- un serveur FiveM récent avec `fx_version cerulean` ;
- un accès Internet depuis le client FiveM ;
- un compte ou un espace VAUNTCORP MDT.

## Installation rapide

### 1. Télécharger la ressource

```bash
cd resources
git clone https://github.com/vauntt/fivem-vaunt-mdt-cad-integration.git vauntmdt
```

Le nom `vauntmdt` est recommandé. Depuis la version 1.1.0, le callback NUI détecte automatiquement le nom réel du dossier.

### 2. L'activer dans `server.cfg`

```cfg
ensure vauntmdt
```

Si vous utilisez un autre nom de dossier, remplacez `vauntmdt` par ce nom dans `server.cfg`.

### 3. Redémarrer la ressource

```text
refresh
ensure vauntmdt
```

Appuyez ensuite sur **F1** en jeu pour ouvrir ou fermer la tablette.

## Structure

```text
vauntmdt/
├── fxmanifest.lua
├── client.lua
└── nui/
    └── ui.html
```

## Utilisation

| Action | Touche |
| --- | --- |
| Ouvrir ou fermer le MDT | `F1` |
| Fermer le MDT | `Échap` |
| Fermer le MDT | Bouton inférieur de la tablette |

### Changer la touche d'ouverture

La touche par défaut utilise le contrôle FiveM `244` (`F1`). Modifiez cette ligne dans `client.lua` :

```lua
if IsControlJustPressed(0, 244) and GetLastInputMethod(0) then
```

Consultez la [référence officielle des contrôles FiveM](https://docs.fivem.net/docs/game-references/controls/) pour choisir un autre identifiant.

## Dépannage

| Problème | Vérification |
| --- | --- |
| La ressource ne démarre pas | Vérifiez `ensure vauntmdt` et le nom du dossier dans `server.cfg`. |
| La tablette ne s'ouvre pas | Vérifiez qu'aucune autre ressource n'utilise `F1` et consultez la console F8. |
| Le MDT reste blanc | Vérifiez la connexion Internet et l'accès à `https://mdt.vauntcorp.com/`. |
| Le personnage garde la tablette | Redémarrez la ressource ; le nettoyage automatique s'exécute aussi à son arrêt. |
| L'authentification n'est pas conservée | Autorisez les cookies nécessaires dans le navigateur intégré FiveM. |

## Compatibilité

- FiveM / GTA V ;
- `fx_version cerulean` ;
- interface NUI Chromium ;
- serveurs GTA RP francophones et internationaux.

## Contribuer

Les corrections ciblées et améliorations compatibles sont les bienvenues. Consultez [CONTRIBUTING.md](CONTRIBUTING.md) avant d'ouvrir une pull request. Pour un problème de sécurité, suivez [SECURITY.md](SECURITY.md).

Si cette ressource vous aide, vous pouvez **ajouter une étoile au dépôt** : cela facilite sa découverte par les autres propriétaires de serveurs FiveM.

## Liens VAUNTCORP

- [VAUNTCORP — MDT GTA RP pour FiveM](https://vauntcorp.com/)
- [Fonctionnalités du logiciel MDT/CAD](https://vauntcorp.com/features)
- [Démonstration de VAUNTCORP MDT](https://mdt.vauntcorp.com/)
- [Communauté et support Discord](https://discord.gg/66khxqRVvd)

## Licence

Distribué sous licence [MIT](LICENSE). VAUNTCORP MDT est une application distincte soumise à ses propres conditions d'utilisation.
