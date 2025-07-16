import 'package:flutter/material.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmVisible = false;
  bool isLoading = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Champ obligatoire';
    if (value.length < 2) return 'Trop court';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Veuillez entrer un email';
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return 'Email invalide';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty)
      return 'Veuillez entrer un mot de passe';
    if (value.length < 8) return 'Minimum 8 caractères';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Au moins une majuscule';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Au moins un chiffre';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text)
      return 'Les mots de passe ne correspondent pas';
    return null;
  }

  void _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // Simulation

    setState(() => isLoading = false);

    // Retour à la page de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un compte"),
        backgroundColor: const Color.fromARGB(255, 24, 1, 138),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Inscription",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Prénom
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: "Prénom",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: _validateName,
              ),
              const SizedBox(height: 16),

              // Nom
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: "Nom",
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: _validateName,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Adresse e-mail",
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),

              // Mot de passe
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => isPasswordVisible = !isPasswordVisible);
                    },
                  ),
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 16),

              // Confirmation
              TextFormField(
                controller: confirmPasswordController,
                obscureText: !isConfirmVisible,
                decoration: InputDecoration(
                  labelText: "Confirmer le mot de passe",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => isConfirmVisible = !isConfirmVisible);
                    },
                  ),
                ),
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 24),

              // Bouton s'inscrire
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 24, 1, 138),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "S'inscrire",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                ),
              ),
              const SizedBox(height: 18),

              // Lien vers login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Déjà inscrit ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(color: Color.fromARGB(255, 24, 1, 138)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
