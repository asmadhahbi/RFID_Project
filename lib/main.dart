import 'package:flutter/material.dart';
import 'AccessList.dart';
import 'landing.dart';
import 'signin.dart';
import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KeyFlow',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const landing(),
    );
  }
}
