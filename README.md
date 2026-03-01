# Vaunt MDT-CAD Integration

Affiche un MDT/CAD dans FiveM via une interface NUI (tablet in-game). Appuyez sur **F1** pour ouvrir/fermer, **Echap** ou le point bleu pour fermer.

---

## Installation

**1. Télécharger la ressource**

```bash
git clone https://github.com/vauntt/fivem-vaunt-mdt-cad-integration.git vauntmdt
```

> Le dossier **doit** s'appeler `vauntmdt` (nom utilisé en interne par la ressource).

**2. Placer dans le dossier resources**

```
server/
└── resources/
    └── vauntmdt/
        ├── client.lua
        ├── fxmanifest.lua
        └── nui/
            └── ui.html
```

**3. Ajouter dans `server.cfg`**

```
ensure vauntmdt
```

**4. Redémarrer le serveur**

---

## Configuration

### Changer la touche d'ouverture

Par défaut : **F1** (control 244). Pour changer, modifiez dans `client.lua` :

```lua
if (IsControlJustPressed(0, 244)) then  -- 244 = F1
```

Référence des codes de touches : [FiveM Controls](https://docs.fivem.net/docs/game-references/controls/)

---

## Utilisation

| Action | Touche |
|--------|--------|
| Ouvrir / Fermer le MDT | F1 |
| Fermer le MDT | Echap |
| Fermer le MDT | Point bleu (bas de la tablette) |

---

## Compatibilité

- FiveM `fx_version cerulean`
- GTA V (gta5)
- Testé sur serveurs FiveM modernes (2024+)
