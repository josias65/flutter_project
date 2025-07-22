import 'package:flutter/material.dart';
import 'soumission.dart';

class MarcheDetailScreen extends StatelessWidget {
  final Map<String, dynamic> appel;

  const MarcheDetailScreen({super.key, required this.appel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appel['titre']),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Détail du Marché",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.blueGrey),
                const SizedBox(width: 8),
                Text(
                  "Date limite : ${appel['dateLimite']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.monetization_on, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  "Budget : ${appel['budget']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Description :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              appel['description'] ??
                  "Aucune description disponible pour ce marché.",
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SoumissionScreen()),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text("Soumettre une offre"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
