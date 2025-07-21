import 'package:flutter/material.dart';

// Écrans login et tableau de bord
import 'package:flutter_app_gestion/login/login.dart';
import 'package:flutter_app_gestion/login/dashboard_screen.dart';

// Clients
import 'package:flutter_app_gestion/client/list_screen.dart';
import 'package:flutter_app_gestion/client/detail_screen.dart';
// ignore: unused_import
import 'package:flutter_app_gestion/client/add_screen.dart';

// Devis
import 'package:flutter_app_gestion/devis/list.dart';
import 'package:flutter_app_gestion/devis/create.dart';

// Appels d’offres

import 'package:flutter_app_gestion/appel_d\'offre/detail_app_screen.dart';
import 'package:flutter_app_gestion/appel_d\'offre/app_screen.dart';

// Routes
import 'package:flutter_app_gestion/routes/app_routes.dart';

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
        AppRoutes.dashboard: (context) => const DashboardScreen(),

        // Clients
        AppRoutes.clients: (context) => const ClientListScreen(),
        '${AppRoutes.clients}/detail': (context) => const ClientDetailScreen(),
        // ignore: equal_keys_in_map
        AppRoutes.clients: (context) => const ClientListScreen(),
        '${AppRoutes.clients}/add': (context) => const AddClientScreen(),
        AppRoutes.addClient: (context) => const AddClientScreen(),

        // Appels d’offres
        AppRoutes.appelsOffres: (context) => const AppelsOffresScreen(),
        '${AppRoutes.appelsOffres}/detail': (context) =>
            const DetailAppelOffreScreen(),

        // Devis
        AppRoutes.devis: (context) => const DevisListScreen(),
        '${AppRoutes.devis}/creation': (context) => const CreateDevisScreen(),
      },
    );
  }
}
