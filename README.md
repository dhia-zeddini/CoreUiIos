# CoreUiIos

**Module SwiftUI iOS** regroupant des composants d’interface réutilisables pour l’application *FindMyWay*. Ce package fait partie des couches `coreUI` et fournit des vues SwiftUI immédiatement exploitables dans les modules fonctionnels.

---

## ⚙️ Fonctionnalités principales

- Composants graphiques standardisés : boutons stylisés, en-têtes, badges d’état, loaders, formulaires.
- Mise en page réactive cohérente avec SwiftUI.
- Compatible iOS 15+ et Swift 5+.
- Usage possible via Swift Package Manager (SPM) ou intégration manuelle.

---

## 📦 Installation

### Via Swift Package Manager

1. Dans Xcode, va dans **File > Add Packages...**
2. Colle l’URL du repo :  
   `https://github.com/dhia-zeddini/CoreUiIos.git`
3. Sélectionne la branche `main` ou un tag spécifique.
4. Ajoute la dépendance à ton target principal.

### Ou intégration manuelle

1. Clone le dépôt dans ton dossier local.
2. Glisse le dossier `CoreUiIos` dans ton projet Xcode.
3. Coche *Copy items if needed*.

---

## 🧩 Contenu du package

- **Composants SwiftUI** :
  - `PrimaryButton`
  - `LoadingOverlayView`
  - `StatusBadge`
  - `HeaderView`
  - `BottomSheetModal`
- **Thèmes** :
  - Couleurs centralisées (`CoreUIColor`)
  - Polices (`CoreUIFont`)
  - Espacements (`CoreUISpacing`)
- **Ressources partagées** :
  - Images, icônes SVG
  - Typographies

---

## 🖼 Exemples visuels *(placeholders à remplacer)*

| Composant            | Image placeholder                          |
|----------------------|---------------------------------------------|
| PrimaryButton        | ![PrimaryButton](docs/img/PrimaryButton.png) |
| LoadingOverlayView   | ![LoadingOverlay](docs/img/Loading.png)       |
| StatusBadge          | ![StatusBadge](docs/img/Badge.png)            |
| HeaderView           | ![HeaderView](docs/img/Header.png)            |

> 📁 Place les images dans un dossier `docs/img/`

---

## 🧠 Utilisation rapide

### Exemples : 
`PrimaryButton`

```swift
PrimaryButton(title: "Commencer", style: .filled) {
    print("Bouton appuyé")
}


`LoadingOverlayView`

```swift
ZStack {
    ContentView()
    if isLoading {
        LoadingOverlayView(message: "Chargement en cours…")
    }
}

`StatusBadge`

```swift
StatusBadge(text: "Nouveau", type: .info)

`StatusBadge`
## 🎨 Style global
Le thème global est accessible via :
```swift
CoreUITheme.shared


Il permet de centraliser :

🎨 Couleurs : CoreUIColor.primary, background, error

🅰️ Polices : CoreUIFont.title, body, caption

📏 Espacement : CoreUISpacing.small, medium, large




