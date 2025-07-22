import 'package:flutter/material.dart';

class HistoriqueMarchesScreen extends StatelessWidget {
  const HistoriqueMarchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste fictive des offres soumises
    final List<Map<String, dynamic>> soumissions = [
      {
        'titre': 'Construction d’un hangar',
        'dateSoumission': '2025-07-15',
        'montant': '3 000 000 FCFA',
        'statut': 'acceptée',
      },
      {
        'titre': 'Fourniture de matériel informatique',
        'dateSoumission': '2025-07-10',
        'montant': '1 200 000 FCFA',
        'statut': 'en attente',
      },
      {
        'titre': 'Réhabilitation d’un bâtiment',
        'dateSoumission': '2025-06-28',
        'montant': '2 400 000 FCFA',
        'statut': 'rejetée',
      },
    ];

    Color getStatutColor(String statut) {
      switch (statut.toLowerCase()) {
        case 'acceptée':
          return Colors.green.shade600;
        case 'rejetée':
          return Colors.red.shade600;
        case 'en attente':
          return Colors.orange.shade600;
        default:
          return Colors.grey.shade600;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des marchés"),
        backgroundColor: const Color(0xFF607D8B),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: soumissions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final soum = soumissions[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: CircleAvatar(
                backgroundColor: getStatutColor(soum['statut']),
                child: const Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
              title: Text(
                soum['titre'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Montant : ${soum['montant']}\nSoumis le ${soum['dateSoumission']}",
                style: const TextStyle(height: 1.4),
              ),
              trailing: Chip(
                label: Text(
                  soum['statut'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: getStatutColor(soum['statut']),
              ),
              isThreeLine: true,
              onTap: () {
                // Action possible : afficher détails, etc.
              },
            ),
          );
        },
      ),
    );
  }
}
