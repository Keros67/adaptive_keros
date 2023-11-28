# Adaptive Keros

Apprendre à créer un package qui s'adapte selon l'OS utilisé.
Ce package est destiné à la création d'applications [Flutter](https://flutter.io)

![Screenshot](/screenshots/Screenshot_iPhone_15_Plus.png)

![Screenshot](/screenshots/Screenshot_Android.png)

## Getting started

Pour utiliser ce package, ajouté au `pubspec.yaml`:

```yaml
dependencies:
  adaptive_keros= ^1.0.1
```

## Usage

Dans le fichier Dart, importez:

```dart
import'package:adaptive_keros/adaptive_keros.dart';
```

Intègrer un Scaffold

```dart
@override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
      string: 'Test',
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Adaptive.text(Colors.red[900], 20, TextAlign.center,
              string: 'Ceci est notre App Test'),
          Adaptive.button(
              onPressed: () => Adaptive.alert(
                  context: context,
                  onPressed: () {
                    print("Test");
                    Navigator.pop(context);
                  }),
              child: Adaptive.text(Colors.red[900], 20, TextAlign.center,
                  string: 'Press Me')),
          Adaptive.button(
            child: Adaptive.text(Colors.red[900], 20, TextAlign.center, string: 'Montrer l\'alerte'), 
            onPressed: (){
              Adaptive.alert(
                context: context,
                onPressed: () {
                  Navigator.pop(context);
                }
              );
            }
            )
        ],
      )),
    );
  }
```
