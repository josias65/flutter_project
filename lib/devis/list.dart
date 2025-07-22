import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../models/devis_model.dart';

class DevisListScreen extends StatelessWidget {
  const DevisListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DevisModel> devisList = [
      DevisModel(
        reference: "DV001",
        client: "Josias",
        date: "2025-07-15",
        status: "En attente",
        total: 1250.0,
      ),
      DevisModel(
        reference: "DV002",
        client: "Sarah",
        date: "2025-07-14",
        status: "Accepté",
        total: 850.0,
      ),
      DevisModel(
        reference: "DV003",
        client: "Daniel",
        date: "2025-07-13",
        status: "Refusé",
        total: 490.0,
      ),
    ];

    Color statusColor(String status) {
      switch (status.toLowerCase()) {
        case 'accepté':
          return Colors.green;
        case 'refusé':
          return Colors.red;
        case 'en attente':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Devis"),
        backgroundColor: const Color(0xFF3F1FBF),
      ),
      body: ListView.builder(
        itemCount: devisList.length,
        itemBuilder: (context, index) {
          final devis = devisList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.description_outlined,
                color: Color(0xFF3F1FBF),
              ),
              title: Text(
                devis.reference,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${devis.client} • ${devis.date}"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    devis.status,
                    style: TextStyle(
                      color: statusColor(devis.status),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${devis.total.toStringAsFixed(2)} €",
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
              // 👉 Navigation vers la page de détail :
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.devisDetail,
                  arguments: devis, // <- C'est un objet DevisModel
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.createDevis),
        icon: const Icon(Icons.add),
        label: const Text("Créer un devis"),
        backgroundColor: const Color(0xFF3F1FBF),
      ),
    );
  }
}
