import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  List<Map<String, dynamic>> clients = [
    {'nom': 'Jean KOLOMUANI', 'entreprise': 'BOURI SARL', 'statut': 'Actif'},
    {
      'nom': 'Malick MOSALITO',
      'entreprise': 'Motologui Industrie',
      'statut': 'Inactif',
    },
  ];

  String search = '';
  String selectedStatut = 'Tous';

  @override
  Widget build(BuildContext context) {
    final filteredClients = clients.where((client) {
      final nom = client['nom'].toString().toLowerCase();
      final statut = client['statut'];
      final matchSearch = nom.contains(search.toLowerCase());
      final matchStatut = selectedStatut == 'Tous' || selectedStatut == statut;
      return matchSearch && matchStatut;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        backgroundColor: const Color(0xFF3F1FBF),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Ajouter un client',
            onPressed: () async {
              final nouveauClient = await Navigator.pushNamed(
                context,
                AppRoutes.addClient,
              );

              if (nouveauClient != null && mounted) {
                setState(() {
                  clients.add(nouveauClient as Map<String, dynamic>);
                });
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) => setState(() => search = value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Rechercher un client...",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              value: selectedStatut,
              decoration: const InputDecoration(
                labelText: "Filtrer par statut",
              ),
              items: const [
                DropdownMenuItem(value: 'Tous', child: Text('Tous')),
                DropdownMenuItem(value: 'Actif', child: Text('Actif')),
                DropdownMenuItem(value: 'Inactif', child: Text('Inactif')),
              ],
              onChanged: (value) =>
                  setState(() => selectedStatut = value ?? 'Tous'),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filteredClients.isEmpty
                ? const Center(
                    child: Text(
                      'Aucun client trouvé',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredClients.length,
                    itemBuilder: (context, index) {
                      final client = filteredClients[index];
                      final isActive = client['statut'] == 'Actif';
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: isActive
                                ? Colors.green.shade300
                                : Colors.red.shade300,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            client['nom'],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(client['entreprise']),
                          trailing: Text(
                            client['statut'],
                            style: TextStyle(
                              color: isActive ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.clientDetail,
                              arguments: client,
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
