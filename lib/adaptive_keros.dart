library adaptive_keros;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  ///Check Platform
  static bool _isIOS() => (Platform.isIOS);

  ///Material Design Adapted

  ///Fonction pour le Scaffold adapté
  static Widget scaffold({required String string, required Widget body}) {
    return _isIOS()
        ? _iOSScaffold(string, body)
        : _androidScaffold(string, body);
  }

  ///Fonction pour le Texte adapté
  static text(Color? color, double? size, TextAlign? align,
      {required String string}) {
    TextStyle style = _textStyle(color, size, align);
    return _isIOS()
        ? _iOSText(align, string: string, style: style)
        : _androidText(align, string: string, style: style);
  }

  ///Fonction pour le Bouton adapté
  static button({required Widget child, required VoidCallback onPressed}) {
    return _isIOS()
        ? _iOSButton(child: child, onPressed: onPressed)
        : _androidElevatedButton(child: child, onPressed: onPressed);
  }

  ///Fonction pour le Alerte adapté
  static Future alert(
      {required BuildContext context, required VoidCallback onPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return _isIOS()
              ? _iOSErrorAlert(context: context, onPressed: onPressed)
              : _androidErrorAlert(context: context, onPressed: onPressed);
        });
  }

  ///Android Material
  ///A ne pas integrer directement au code mais plutôt utiliser les fonctions qui s'adaptent

  ///Le Scaffold Android
  static Scaffold _androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(string),
      ),
      body: body,
    );
  }

  /// Texte Android
  static Text _androidText(TextAlign? align,
      {required String string, required TextStyle style}) {
    return Text(
      string,
      textAlign: align,
      style: style,
    );
  }

  ///Elevated Button Android
  static ElevatedButton _androidElevatedButton(
      {required Widget child, required VoidCallback onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }

  ///Alerte Android
  static _androidErrorAlert(
      {required BuildContext context, required VoidCallback onPressed}) {
    return AlertDialog(
      title: const Text('Erreur'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Une erreur est apparue'),
        ],
      ),
      actions: [button(onPressed: onPressed, child: const Text('Ok'))],
    );
  }

  ///iOS Material
  ///A ne pas integrer directement au code mais plutôt utiliser les fonctions qui s'adaptent

  ///Le Scaffold iOS
  static CupertinoPageScaffold _iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(string),
      ),
      child: body,
    );
  }

  ///Text iOS
  static DefaultTextStyle _iOSText(TextAlign? align,
      {required String string, required TextStyle style}) {
    return DefaultTextStyle(
      style: style,
      child: Text(
        string,
        textAlign: align ?? TextAlign.left,
      ),
    );
  }

  ///Bouton iOS
  static CupertinoButton _iOSButton(
      {required Widget child, required VoidCallback onPressed}) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }

  ///Alerte iOS
  static _iOSErrorAlert(
      {required BuildContext context, required VoidCallback onPressed}) {
    return CupertinoAlertDialog(
      title: const Text('Erreur'),
      content: const Column(
        children: [
          Text('Une erreur est apparue'),
        ],
      ),
      actions: [button(onPressed: onPressed, child: const Text('Ok'))],
    );
  }

  ///Both Material
  ///A ne pas integrer directement au code mais plutôt utiliser les fonctions qui s'adaptent

  ///Style de Texte qui s'intègre aux textes iOS et Android
  static TextStyle _textStyle(Color? color, double? size, TextAlign? align) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }
}
