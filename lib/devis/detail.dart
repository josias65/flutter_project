import 'package:flutter/material.dart';
import '../../models/devis_model.dart';

class DevisDetailScreen extends StatelessWidget {
  final DevisModel devis;

  const DevisDetailScreen({super.key, required this.devis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Devis ${devis.reference}")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Client : ${devis.client}",
              style: const TextStyle(fontSize: 18),
            ),
            Text("Date : ${devis.date}"),
            Text("Statut : ${devis.status}"),
            const SizedBox(height: 20),
            const Text(
              "Document PDF (exemple fictif)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Expanded(
              child: Center(child: Icon(Icons.picture_as_pdf, size: 100)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text("Télécharger"),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text("Partager"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
