import 'package:flutter/material.dart';

class DetailAppelOffreScreen extends StatelessWidget {
  const DetailAppelOffreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail Appel d’Offre'),
        backgroundColor: const Color.fromARGB(255, 15, 4, 101),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fourniture de matériel informatique',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Date de publication : 21/07/2025'),
            const Text('Date limite : 30/07/2025'),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cet appel d\'offres concerne la fourniture de divers équipements informatiques pour nos bureaux : ordinateurs, imprimantes, onduleurs, etc.',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action pour soumettre une offre
                },
                icon: const Icon(Icons.send),
                label: const Text('Soumettre une offre'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 4, 101),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
