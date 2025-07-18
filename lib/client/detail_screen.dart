import 'package:flutter/material.dart';

class ClientDetailScreen extends StatelessWidget {
  const ClientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(client['nom']),
          backgroundColor: const Color(0xFF3F1FBF),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Ventes"),
              Tab(text: "Maintenance"),
              Tab(text: "Documents"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildVentesTab(),
            _buildMaintenanceTab(),
            _buildDocumentsTab(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Naviguer vers la création de devis
                  },
                  icon: const Icon(Icons.description),
                  label: const Text("Créer un devis"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Envoyer un message
                  },
                  icon: const Icon(Icons.message),
                  label: const Text("Message"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVentesTab() {
    return const Center(child: Text("Historique des ventes..."));
  }

  Widget _buildMaintenanceTab() {
    return const Center(child: Text("Interventions de maintenance..."));
  }

  Widget _buildDocumentsTab() {
    return const Center(child: Text("Documents liés..."));
  }
}
