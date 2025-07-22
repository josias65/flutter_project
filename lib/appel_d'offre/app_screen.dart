import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class AppelsOffresScreen extends StatelessWidget {
  const AppelsOffresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appels = [
      {
        'titre': 'Acquisition de serveurs haute performance',
        'date': '21/07/2025',
        'etat': 'Ouvert',
      },
      {
        'titre': 'Déploiement d’un réseau sécurisé pour datacenter',
        'date': '18/07/2025',
        'etat': 'Clôturé',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appels d’offres - IT'),
        backgroundColor: const Color(0xFF0F0465),
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
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              title: Text(
                appel['titre']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text('Date limite : ${appel['date']}'),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: appel['etat'] == 'Ouvert'
                      ? Colors.green.shade100
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  appel['etat']!,
                  style: TextStyle(
                    color: appel['etat'] == 'Ouvert'
                        ? Colors.green.shade800
                        : Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.detailAppelOffre,
                  arguments: appel, // <-- IMPORTANT : passer l'objet ici
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF0F0465),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addAppelOffre);
        },
        icon: const Icon(Icons.add),
        label: const Text("Nouveau"),
      ),
    );
  }
}
