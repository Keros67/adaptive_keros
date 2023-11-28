import 'package:adaptive_keros/adaptive_keros.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
      string: 'Test',
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Adaptive.text(Colors.red[900], 20, TextAlign.center,
              string: '${Adaptive.isIOS()}'),
          Adaptive.button(
              onPressed: () => Adaptive.alert(
                  context: context,
                  onPressed: () {
                    print("Success");
                    Navigator.pop(context);
                  }),
              child: Adaptive.text(Colors.red[900], 20, TextAlign.center,
                  string: 'Press Me')),
        ],
      )),
    );
  }
}
