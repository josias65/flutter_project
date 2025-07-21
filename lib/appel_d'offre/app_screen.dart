import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class AppelsOffresScreen extends StatelessWidget {
  const AppelsOffresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appels = [
      {
        'titre': 'Fourniture de matériel informatique',
        'date': '21/07/2025',
        'etat': 'Ouvert',
      },
      {
        'titre': 'Travaux de rénovation des bureaux',
        'date': '18/07/2025',
        'etat': 'Clôturé',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appels d’offres'),
        backgroundColor: const Color.fromARGB(255, 15, 4, 101),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: appels.length,
        itemBuilder: (context, index) {
          final appel = appels[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(appel['titre']!),
              subtitle: Text('Date: ${appel['date']}'),
              trailing: Text(
                appel['etat']!,
                style: TextStyle(
                  color: appel['etat'] == 'Ouvert' ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.detailAppelOffre);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 15, 4, 101),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addAppelOffre);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
