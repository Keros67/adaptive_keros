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

  //Both Material
  static TextStyle textStyle(Color? color, double? size, TextAlign? align) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }
}
