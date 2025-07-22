import 'package:flutter/material.dart';

class DetailAppelOffreScreen extends StatelessWidget {
  const DetailAppelOffreScreen({
    super.key,
    required Map<String, dynamic> appel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail Appel d’Offre - IT'),
        backgroundColor: const Color(0xFF0F0465),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acquisition de serveurs haute performance',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text(
                  'Date de publication : 21/07/2025',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.hourglass_bottom, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text(
                  'Date limite : 30/07/2025',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cet appel d\'offres vise l\'achat et l\'installation de serveurs performants pour notre infrastructure informatique. '
              'Les spécifications techniques détaillées incluent les processeurs, la mémoire, le stockage et la garantie.',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Ajouter la logique pour soumettre une offre
                },
                icon: const Icon(Icons.send),
                label: const Text('Soumettre une offre'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F0465),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
