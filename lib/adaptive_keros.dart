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

  static Future alert({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iOSErrorAlert(context: context)
              : androidErrorAlert(context: context);
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

  static androidErrorAlert({required BuildContext context}) {
    return AlertDialog(
      title: const Text('Erreur'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Une erreur est apparue'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Ok'))
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

  static iOSErrorAlert({required BuildContext context}) {
    return CupertinoAlertDialog(
      title: const Text('Erreur'),
      content: const Column(
        children: [
          Text('Une erreur est apparue'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Ok'))
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
}
