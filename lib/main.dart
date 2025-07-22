import 'package:flutter/material.dart';

// Écrans login et tableau de bord
import 'package:flutter_app_gestion/login/login.dart';
import 'package:flutter_app_gestion/login/dashboard_screen.dart';

// Clients
import 'package:flutter_app_gestion/client/list_screen.dart';
import 'package:flutter_app_gestion/client/detail_screen.dart';
import 'package:flutter_app_gestion/client/add_screen.dart';

// Devis
import 'package:flutter_app_gestion/devis/list.dart';
import 'package:flutter_app_gestion/devis/create.dart';
import 'package:flutter_app_gestion/devis/detail.dart';
import 'package:flutter_app_gestion/models/devis_model.dart';

// Appels d'offres
import 'package:flutter_app_gestion/appel_d\'offre/detail_app_screen.dart';
import 'package:flutter_app_gestion/appel_d\'offre/app_screen.dart';

// Marché
import 'package:flutter_app_gestion/marche/marche_list.dart';
import 'package:flutter_app_gestion/marche/marche_detail.dart';
import 'package:flutter_app_gestion/marche/soumission.dart';
import 'package:flutter_app_gestion/marche/historique_marches.dart';

// Stock
import 'package:flutter_app_gestion/stock/stock_list.dart';
import 'package:flutter_app_gestion/stock/stock_detail.dart';
import 'package:flutter_app_gestion/stock/stock_edit.dart';

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
        // Auth / Dashboard
        '/': (context) => const LoginScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),

        // Clients
        AppRoutes.clients: (context) => const ClientListScreen(),
        AppRoutes.addClient: (context) => const AddClientScreen(),

        // Appels d'offres
        AppRoutes.appelsOffres: (context) => const AppelsOffresScreen(),
        AppRoutes.addAppelOffre: (context) => const AppelsOffresScreen(),

        // Devis
        AppRoutes.devis: (context) => const DevisListScreen(),
        AppRoutes.createDevis: (context) => const CreateDevisScreen(),

        // Marché
        AppRoutes.marcheList: (context) => const MarcheListScreen(),
        AppRoutes.marcheSoumission: (context) => const SoumissionScreen(),
        AppRoutes.marcheHistorique: (context) =>
            const HistoriqueMarchesScreen(),

        // Stock
        AppRoutes.stock: (context) => const StockListScreen(),
        AppRoutes.stockEdit: (context) => const StockEditScreen(),
        AppRoutes.addStock: (context) => const StockEditScreen(),
      },
      onGenerateRoute: (settings) {
        // Détail appel d'offre
        if (settings.name == AppRoutes.detailAppelOffre) {
          final appel = settings.arguments as Map<String, dynamic>?;
          if (appel != null) {
            return MaterialPageRoute(
              builder: (context) => DetailAppelOffreScreen(appel: appel),
            );
          }
        }

        // Détail marché
        if (settings.name == AppRoutes.marcheDetail) {
          final appel = settings.arguments as Map<String, dynamic>?;
          if (appel != null) {
            return MaterialPageRoute(
              builder: (context) => MarcheDetailScreen(appel: appel),
            );
          }
        }

        // Détail stock
        if (settings.name == AppRoutes.stockDetail) {
          final article = settings.arguments as Map<String, dynamic>?;
          if (article != null) {
            return MaterialPageRoute(
              builder: (context) => StockDetailScreen(article: article),
            );
          }
        }

        // Détail client
        if (settings.name == AppRoutes.clientDetail) {
          final client = settings.arguments as Map<String, dynamic>?;
          if (client != null) {
            return MaterialPageRoute(
              builder: (context) => ClientDetailScreen(client: client),
            );
          }
        }

        // ✅ Détail devis
        if (settings.name == AppRoutes.devisDetail) {
          final devis = settings.arguments as DevisModel?;
          if (devis != null) {
            return MaterialPageRoute(
              builder: (context) => DevisDetailScreen(devis: devis),
            );
          }
        }

        return null;
      },
    );
  }
}
