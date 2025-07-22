import 'package:flutter/material.dart';
import 'stock_edit.dart';

class StockDetailScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  const StockDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['nom']),
        backgroundColor: const Color(0xFF2196F3),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updatedArticle = await Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (_) => StockEditScreen(existingItem: article),
                ),
              );
              if (updatedArticle != null) {
                Navigator.pop(context, updatedArticle);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                title: const Text('Nom du matériel'),
                subtitle: Text(article['nom']),
              ),
              ListTile(
                title: const Text('Référence'),
                subtitle: Text(article['reference']),
              ),
              ListTile(
                title: const Text('Quantité'),
                subtitle: Text('${article['quantite']}'),
              ),
              ListTile(
                title: const Text('Prix unitaire'),
                subtitle: Text('${article['prixUnitaire']} FCFA'),
              ),
              ListTile(
                title: const Text('Seuil minimum'),
                subtitle: Text('${article['seuilMin']}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
