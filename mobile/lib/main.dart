import 'package:flutter/material.dart';
import 'package:mobile/screen/formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Formulario(),
      debugShowCheckedModeBanner: false,
    );
  }
}