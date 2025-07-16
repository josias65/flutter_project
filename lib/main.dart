import 'package:flutter/material.dart';
import 'package:flutter_app_gestion/client/list_screen.dart';
import 'package:flutter_app_gestion/devis/create.dart';

import 'package:flutter_app_gestion/devis/list.dart';
import 'package:flutter_app_gestion/login/compte.dart';
import 'package:flutter_app_gestion/login/login.dart';

import 'package:flutter_app_gestion/login/dashboard_screen.dart';
// ignore: unused_import
// ignore: prefer_typing_uninitialized_variables
import 'package:flutter_app_gestion/login/mot_de_passe.dart'; // Tu dois créer ce fichier avec l’interface du tableau de bord
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
        '/dashboard': (context) => const DashboardScreen(),
        '/inscription': (context) => const RegisterScreen(),
        '/clients': (context) => const ClientListScreen(),

        '/devis/creation': (context) => const CreateDevisScreen(),
        '/devis': (context) => const DevisListScreen(),

        // si tu veux gérer la création de compte
      },
    );
  }
}
