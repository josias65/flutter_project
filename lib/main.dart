import 'package:flutter/material.dart';
import 'package:flutter_app_gestion/login/compte.dart' show PasswordScreen;
import 'package:flutter_app_gestion/login/login.dart';
import 'screen/tableau_de_bord.dart'; // Tu dois créer ce fichier avec l’interface du tableau de bord
// Optionnel si tu gères l'inscription

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Gestion Commerciale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/mot_de_passe': (context) => const PasswordScreen(),
        '/tableau_de_bord': (context) => const DashboardScreen(),
        // si tu veux gérer la création de compte
      },
    );
  }
}
