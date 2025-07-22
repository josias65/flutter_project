import 'package:flutter/material.dart';
import 'stock_detail.dart';
import 'stock_edit.dart';

class StockListScreen extends StatefulWidget {
  const StockListScreen({super.key});

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  final List<Map<String, dynamic>> _materiels = [
    {
      'id': 1,
      'nom': 'Ordinateur Portable HP',
      'reference': 'HP-LAPTOP-01',
      'quantite': 8,
      'prixUnitaire': 350000,
      'seuilMin': 5,
    },
    {
      'id': 2,
      'nom': 'Imprimante Canon',
      'reference': 'CAN-PRNT-2023',
      'quantite': 3,
      'prixUnitaire': 150000,
      'seuilMin': 2,
    },
    {
      'id': 3,
      'nom': 'Routeur TP-Link',
      'reference': 'TPL-ROUTER-AX1800',
      'quantite': 10,
      'prixUnitaire': 55000,
      'seuilMin': 4,
    },
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredMateriels = _materiels.where((item) {
      final nom = item['nom'].toString().toLowerCase();
      final ref = item['reference'].toString().toLowerCase();
      final query = _searchQuery.toLowerCase();
      return nom.contains(query) || ref.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Informatique'),
        backgroundColor: const Color(0xFF2196F3),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Rechercher un matériel',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: filteredMateriels.isEmpty
                ? const Center(child: Text('Aucun matériel trouvé'))
                : ListView.builder(
                    itemCount: filteredMateriels.length,
                    itemBuilder: (context, index) {
                      final item = filteredMateriels[index];
                      final quantite = item['quantite'] as int;
                      final seuilMin = item['seuilMin'] as int;
                      final enRupture = quantite <= seuilMin;

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: enRupture
                                ? Colors.red
                                : Colors.green,
                            child: Text(item['nom'][0]),
                          ),
                          title: Text(item['nom']),
                          subtitle: Text(
                            'Réf: ${item['reference']} • Qté: $quantite • Prix: ${item['prixUnitaire']} FCFA',
                          ),
                          trailing: enRupture
                              ? const Icon(Icons.warning, color: Colors.red)
                              : const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                          onTap: () async {
                            final updated =
                                await Navigator.push<Map<String, dynamic>>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        StockDetailScreen(article: item),
                                  ),
                                );
                            if (updated != null) {
                              setState(() {
                                final idx = _materiels.indexWhere(
                                  (a) => a['id'] == updated['id'],
                                );
                                if (idx != -1) {
                                  _materiels[idx] = updated;
                                }
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nouveauMateriel = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (_) => const StockEditScreen()),
          );
          if (nouveauMateriel != null) {
            setState(() {
              _materiels.add(nouveauMateriel);
            });
          }
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
