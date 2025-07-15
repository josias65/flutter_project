import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau de bord',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Première ligne de cartes
            Row(
              children: [
                _buildStatCard('Maisons disponibles', false, '10'),
                const SizedBox(width: 16),
                _buildStatCard('Visiteurs enregistrés', true, '5'),
              ],
            ),
            const SizedBox(height: 16),

            // Deuxième ligne de cartes
            Row(
              children: [
                _buildStatCard('Réservations récentes', false, '3'),
                const SizedBox(width: 16),
                _buildStatCard('Profils', true, '8'),
              ],
            ),
            const SizedBox(height: 24),

            // Section Statistiques
            const Text(
              'Statistiques',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Cases à cocher des statistiques
            _buildCheckboxItem('Maisons les plus réservées', false),
            _buildCheckboxItem('Visites', true),
            _buildCheckboxItem('Réservations en cours', false),
            const SizedBox(height: 24),

            // Navigation
            const Text(
              'Navigation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildCheckboxItem('Accueil', false),
            _buildCheckboxItem('Tableau de bord', true),
            _buildCheckboxItem('Compte', true),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, bool isChecked, String value) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(value: isChecked, onChanged: (bool? value) {}),
                  Text(title, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String title, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(value: isChecked, onChanged: (bool? value) {}),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
