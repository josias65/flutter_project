import 'package:flutter/material.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final entrepriseController = TextEditingController();
  String statut = 'Actif';

  void _saveClient() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'nom': nomController.text,
        'entreprise': entrepriseController.text,
        'statut': statut,
      }); // On retourne le client
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un client'),
        backgroundColor: const Color(0xFF3F1FBF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomController,
                decoration: const InputDecoration(labelText: 'Nom complet'),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer le nom' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: entrepriseController,
                decoration: const InputDecoration(
                  labelText: 'Nom de l’entreprise',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer l’entreprise' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: statut,
                decoration: const InputDecoration(labelText: 'Statut'),
                items: const [
                  DropdownMenuItem(value: 'Actif', child: Text('Actif')),
                  DropdownMenuItem(value: 'Inactif', child: Text('Inactif')),
                ],
                onChanged: (value) => setState(() => statut = value!),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveClient,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F1FBF),
                ),
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
