import 'package:flutter/material.dart';

import 'Views/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoWelcomePage(context),
    );
  }
}

Widget GoWelcomePage (BuildContext context) {
  return WelcomePage();
}