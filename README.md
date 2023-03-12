# Jaho challenge

<img src="./assets/images/screen_shoot1.png" height="300">
<img src="./assets/images/screen_shoot2.png" height="300">

Noted: No need account to login, just hit "login" button to by pass
### Requirement
- [x] Your application needs to have a collection of users presented in both Grid and List view (there should be a button to switch between the two).
- [x] Each list item has to have all the fields: email, full name and avatar
- [x] Your application should load users’ avatars and cache them. The avatar should have a placeholder
- [x] Your application needs to have “loading more” functionality with a “loading more” icon.
- [x] Your application has to be presented using either MVVM or BLOC pattern.
- [x] Your application should have clear UX/UI presentations.
- [x] Your application has to be pushed to github and has a compiling guideline attached.
### Bonus
- Dark mode
- Save local user settings

### Local Setup
We use the following tools with specified version.

|Product|Version|
|--- | ---|
|Dart|v2.18.6|
|Flutter|v3.3.10|

### Requirements

**For the first time developer**  
You need to install FVM before move to the next step:
```bash
% dart pub global activate fvm
```

At root project folder: (ex: $User/project/jaho-challenge)
```bash
% fvm install 3.3.10
% fvm use 3.3.10
% fvm flutter pub get
% fvm flutter run
```

About FVM: https://fvm.app/docs/getting_started/overview

## Code structures

```tree
assets
├── fonts // Font file
└── images // Asset images
lib
├── common // Global variable
├── l10n // localization config
├── helper // Helper utility classes
├── model // Modals of data
├── repository // Repositories for API communication
├── route // Route settings
├── theme // Theme file
├── screens // View directories 
└── widget // Widgets used across the pages
```
