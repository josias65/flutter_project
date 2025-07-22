import 'package:flutter/material.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({super.key});

  @override
  State<AddStockScreen> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController marqueController = TextEditingController();
  final TextEditingController modeleController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  DateTime? dateEntree;

  String type = 'PC';
  String etat = 'Neuf';

  final List<String> types = [
    'PC',
    'Imprimante',
    'Routeur',
    'Switch',
    'Serveur',
  ];
  final List<String> etats = ['Neuf', 'Bon état', 'À réparer', 'Hors service'];

  void _enregistrer() {
    if (_formKey.currentState!.validate()) {
      final nouvelItem = {
        'nom': nomController.text,
        'type': type,
        'marque': marqueController.text,
        'modele': modeleController.text,
        'quantite': int.parse(quantiteController.text),
        'etat': etat,
        'dateEntree':
            dateEntree?.toIso8601String() ?? DateTime.now().toIso8601String(),
      };

      Navigator.pop(context, nouvelItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Stock'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom de l\'appareil',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Ce champ est requis' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: type,
                items: types
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (value) => setState(() => type = value!),
                decoration: const InputDecoration(
                  labelText: 'Type d\'appareil',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: marqueController,
                decoration: const InputDecoration(labelText: 'Marque'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: modeleController,
                decoration: const InputDecoration(labelText: 'Modèle'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: quantiteController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantité'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une quantité';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Entrez un nombre valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: etat,
                items: etats
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() => etat = value!),
                decoration: const InputDecoration(labelText: 'État'),
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Date d\'entrée'),
                subtitle: Text(
                  dateEntree == null
                      ? 'Aucune date sélectionnée'
                      : '${dateEntree!.day}/${dateEntree!.month}/${dateEntree!.year}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() => dateEntree = picked);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _enregistrer,
                icon: const Icon(Icons.save),
                label: const Text('Enregistrer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
