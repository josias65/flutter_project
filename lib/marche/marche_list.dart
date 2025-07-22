import 'package:flutter/material.dart';
import 'marche_detail.dart';

class MarcheListScreen extends StatelessWidget {
  const MarcheListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appelsOffres = [
      {
        'id': 1,
        'titre': 'Fourniture de matériel informatique',
        'dateLimite': '31 juillet 2025',
        'budget': '5 000 000 FCFA',
      },
      {
        'id': 2,
        'titre': 'Construction d’un entrepôt logistique',
        'dateLimite': '10 août 2025',
        'budget': '80 000 000 FCFA',
      },
      {
        'id': 3,
        'titre': 'Entretien des espaces verts',
        'dateLimite': '20 août 2025',
        'budget': '12 000 000 FCFA',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marchés disponibles'),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: appelsOffres.length,
        itemBuilder: (context, index) {
          final appel = appelsOffres[index];
          final String titre =
              appel['titre']?.toString() ?? 'Marché sans titre';
          final String dateLimite =
              appel['dateLimite']?.toString() ?? 'Inconnue';
          final String budget = appel['budget']?.toString() ?? 'Non spécifié';

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: const Icon(
                Icons.assignment_outlined,
                size: 32,
                color: Color(0xFF3F51B5),
              ),
              title: Text(
                titre,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text("Date limite : $dateLimite"),
                  Text("Budget : $budget"),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MarcheDetailScreen(appel: appel),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
