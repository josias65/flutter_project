import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  List<Map<String, dynamic>> clients = [
    {'nom': 'Jean Dupont', 'entreprise': 'Dupont SARL', 'statut': 'Actif'},
    {
      'nom': 'Claire Morel',
      'entreprise': 'Morel Industrie',
      'statut': 'Inactif',
    },
  ];

  String search = '';
  String selectedStatut = 'Tous';

  @override
  Widget build(BuildContext context) {
    var filteredClients = clients.where((client) {
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
            onPressed: () {
              // Ajouter un client (navigation ou modal)
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
                fillColor: Colors.grey[200],
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
              items: [
                'Tous',
                'Actif',
                'Inactif',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) =>
                  setState(() => selectedStatut = value ?? 'Tous'),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: filteredClients.length,
              itemBuilder: (context, index) {
                final client = filteredClients[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(client['nom']),
                    subtitle: Text(client['entreprise']),
                    trailing: Text(
                      client['statut'],
                      style: TextStyle(
                        color: client['statut'] == 'Actif'
                            ? Colors.green
                            : Colors.red,
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
