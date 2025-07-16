import 'package:flutter/material.dart';
// Tu dois créer ce fichier avec l’interface du tableau de bord

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final emailController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void resetPassword() async {
    final email = emailController.text.trim();

    if (!isEmailValid(email)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Adresse e-mail invalide")));
      return;
    }

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Lien de réinitialisation envoyé !')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Réinitialiser le mot de passe')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_reset,
                size: 60,
                color: Color.fromARGB(255, 24, 1, 138),
              ),
              const SizedBox(height: 24),
              const Text(
                'Mot de passe oublié ?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Entrez votre adresse e-mail pour recevoir un lien de réinitialisation.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 169, 211, 240),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: emailController.text.isEmpty || isLoading
                      ? null
                      : resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: emailController.text.isEmpty
                        ? Colors.grey
                        : const Color.fromARGB(255, 24, 1, 138),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Envoyer',
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
