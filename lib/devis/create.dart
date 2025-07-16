import 'package:flutter/material.dart';

class CreateDevisScreen extends StatefulWidget {
  const CreateDevisScreen({super.key});

  @override
  State<CreateDevisScreen> createState() => _CreateDevisScreenState();
}

class _CreateDevisScreenState extends State<CreateDevisScreen> {
  String selectedClient = "";
  List<String> clients = ["Josias", "Sarah", "Daniel"];
  List<Map<String, dynamic>> articles = [];

  final articleController = TextEditingController();
  final prixController = TextEditingController();

  double get total {
    return articles.fold(0, (sum, item) => sum + (item['prix'] as double));
  }

  void ajouterArticle() {
    if (articleController.text.isNotEmpty && prixController.text.isNotEmpty) {
      setState(() {
        articles.add({
          "nom": articleController.text,
          "prix": double.tryParse(prixController.text) ?? 0.0,
        });
        articleController.clear();
        prixController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Créer un Devis")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: "Sélectionner un client",
              ),
              items: clients.map((client) {
                return DropdownMenuItem(value: client, child: Text(client));
              }).toList(),
              onChanged: (value) => setState(() => selectedClient = value!),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: articleController,
                    decoration: const InputDecoration(labelText: "Nom article"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: prixController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Prix"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: ajouterArticle,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Articles ajoutés :"),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final item = articles[index];
                  return ListTile(
                    title: Text(item['nom']),
                    trailing: Text("${item['prix']} €"),
                  );
                },
              ),
            ),
            Text(
              "Total : $total €",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Appel API /envoyer devis
              },
              icon: const Icon(Icons.send),
              label: const Text("Envoyer le devis"),
            ),
          ],
        ),
      ),
    );
  }
}
