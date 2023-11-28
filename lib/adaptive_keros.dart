library adaptive_keros;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  //Check Platform
  static bool isIOS() => (Platform.isIOS);

  //Material Design Adapted
  static Widget scaffold({required String string, required Widget body}) {
    return isIOS() ? iOSScaffold(string, body) : androidScaffold(string, body);
  }

  static text(Color? color, double? size, TextAlign? align,
      {required String string}) {
    TextStyle style = textStyle(color, size, align);
    return isIOS()
        ? iOSText(align, string: string, style: style)
        : androidText(align, string: string, style: style);
  }

  static button({required Widget child, required VoidCallback onPressed}) {
    return isIOS()
        ? iOSButton(child: child, onPressed: onPressed)
        : androidElevatedButton(child: child, onPressed: onPressed);
  }

  static Future alert({required BuildContext context, required VoidCallback onPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iOSErrorAlert(context: context, onPressed: onPressed)
              : androidErrorAlert(context: context, onPressed: onPressed);
        });
  }

  //Android Material
  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(string),
      ),
      body: body,
    );
  }

  static Text androidText(TextAlign? align,
      {required String string, required TextStyle style}) {
    return Text(
      string,
      style: style,
    );
  }

  static ElevatedButton androidElevatedButton(
      {required Widget child, required VoidCallback onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }

  static androidErrorAlert({required BuildContext context, required VoidCallback onPressed}) {
    return AlertDialog(
      title: const Text('Erreur'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Une erreur est apparue'),
        ],
      ),
      actions: [
        button(
            onPressed: onPressed, child: const Text('Ok'))
      ],
    );
  }

  //iOS Material
  static CupertinoPageScaffold iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(string),
      ),
      child: body,
    );
  }

  static DefaultTextStyle iOSText(TextAlign? align,
      {required String string, required TextStyle style}) {
    return DefaultTextStyle(
      style: style,
      child: Text(
        string,
        textAlign: align ?? TextAlign.left,
      ),
    );
  }

  static iOSErrorAlert({required BuildContext context, required VoidCallback onPressed}) {
    return CupertinoAlertDialog(
      title: const Text('Erreur'),
      content: const Column(
        children: [
          Text('Une erreur est apparue'),
        ],
      ),
      actions: [
        button(
            onPressed: onPressed, child: const Text('Ok'))
      ],
    );
  }

  //Both Material
  static TextStyle textStyle(Color? color, double? size, TextAlign? align) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }

  static CupertinoButton iOSButton(
      {required Widget child, required VoidCallback onPressed}) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }
}
