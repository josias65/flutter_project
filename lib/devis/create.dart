import 'package:flutter/material.dart';

class CreateDevisScreen extends StatefulWidget {
  const CreateDevisScreen({super.key});

  @override
  State<CreateDevisScreen> createState() => _CreateDevisScreenState();
}

class _CreateDevisScreenState extends State<CreateDevisScreen> {
  String? selectedClient;
  final List<String> clients = ["Josias", "Joyce", "Malick"];
  final List<Map<String, dynamic>> articles = [];

  final articleController = TextEditingController();
  final prixController = TextEditingController();

  double get total =>
      articles.fold(0, (sum, item) => sum + (item['prix'] as double));

  void ajouterArticle() {
    final nom = articleController.text.trim();
    final prixText = prixController.text.trim();
    final prix = double.tryParse(prixText);

    if (nom.isEmpty || prix == null || prix <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer un article valide et un prix > 0'),
        ),
      );
      return;
    }

    setState(() {
      articles.add({"nom": nom, "prix": prix});
      articleController.clear();
      prixController.clear();
    });
  }

  @override
  void dispose() {
    articleController.dispose();
    prixController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un Devis"),
        backgroundColor: const Color(0xFF3F1FBF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Sélectionner un client",
                border: OutlineInputBorder(),
              ),
              value: selectedClient,
              items: clients
                  .map(
                    (client) =>
                        DropdownMenuItem(value: client, child: Text(client)),
                  )
                  .toList(),
              onChanged: (value) => setState(() => selectedClient = value),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: articleController,
                    decoration: const InputDecoration(
                      labelText: "Nom de l'article",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: prixController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: "Prix (€)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: ajouterArticle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F1FBF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Articles ajoutés :",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: articles.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucun article ajouté',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.separated(
                      itemCount: articles.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = articles[index];
                        return ListTile(
                          title: Text(item['nom']),
                          trailing: Text(
                            "${item['prix'].toStringAsFixed(2)} €",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xFF3F1FBF),
                            child: Text(
                              item['nom'][0].toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 12),
            Text(
              "Total : ${total.toStringAsFixed(2)} €",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (selectedClient == null || articles.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Veuillez sélectionner un client et ajouter au moins un article.',
                        ),
                      ),
                    );
                    return;
                  }
                  // TODO: Appel API pour envoyer le devis
                },
                icon: const Icon(Icons.send),
                label: const Text("Envoyer le devis"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F1FBF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
