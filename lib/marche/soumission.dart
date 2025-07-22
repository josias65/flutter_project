import 'package:flutter/material.dart';

class SoumissionScreen extends StatefulWidget {
  const SoumissionScreen({super.key});

  @override
  State<SoumissionScreen> createState() => _SoumissionScreenState();
}

class _SoumissionScreenState extends State<SoumissionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController montantController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isSubmitting = false;

  // Méthode appelée lors de la soumission du formulaire
  void _submitOffer() {
    if (_formKey.currentState!.validate()) {
      setState(() => isSubmitting = true);

      // Simuler un appel réseau ou traitement asynchrone
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => isSubmitting = false);

        // Afficher un dialogue de confirmation
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Soumission réussie"),
            content: const Text("Votre offre a été soumise avec succès."),
            actions: [
              TextButton(
                onPressed: () {
                  // Retourner à l'écran principal (liste des marchés)
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soumettre une offre"),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: montantController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Montant proposé (FCFA)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer un montant";
                  }
                  if (double.tryParse(value) == null) {
                    return "Veuillez entrer un nombre valide";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: "Description de l'offre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez décrire votre offre";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSubmitting ? null : _submitOffer,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF4CAF50),
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text(
                          "Soumettre",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
