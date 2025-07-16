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

    return Scaffold(
      appBar: AppBar(title: const Text("Liste des Devis")),
      body: ListView.builder(
        itemCount: devisList.length,
        itemBuilder: (context, index) {
          final devis = devisList[index];
          return ListTile(
            leading: const Icon(Icons.description),
            title: Text(devis.reference),
            subtitle: Text("${devis.client} - ${devis.date}"),
            trailing: Text(devis.status),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.devisDetail,
                arguments: devis,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.createDevis),
        icon: const Icon(Icons.add),
        label: const Text("Créer un devis"),
      ),
    );
  }
}
