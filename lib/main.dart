import 'package:flutter/material.dart';
import 'login/login.dart';
import 'login/mot_de_passe.dart';
import 'login/compte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// ignore: non_constant_identifier_names
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
      routes: {
        '/compte': (context) => const CompteScreen(),
        '/mot_de_passe': (context) => const PasswordScreen(),
      },
    );
  }
}
