import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'NewAccount.dart';

void main() {
  runApp(LogInSignUpPage());
}

class LogInSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo en haut
            Image.asset(
              '../assets/logo_autism.png', // Assure-toi de placer ton logo dans le bon dossier
              height: 250, // Ajuster la taille du logo
            ),
            const SizedBox(height: 40), // Espacement après le logo
            // Texte TOGETHER AUTISM
            const Text(
              "TOGETHER AUTISM",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2260FF), // Couleur du texte bleu
              ),
            ),
            const SizedBox(height: 10),
            // Sous-texte
            const Text(
              "Together, we can rewrite the narrative.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey, // Couleur grise du sous-texte
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50), // Espacement avant les boutons
            // Bouton Log In
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Couleur bleu vif pour Log In
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bords arrondis
                ),
                minimumSize: const Size(double.infinity, 50), // Bouton large
              ),
              onPressed: () {
                // Action pour Log In
                navTo(context, LogIn()); // Naviguer vers la page LogInPage
              },
              child: const Text(
                "Log In",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Texte blanc
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacement entre les boutons
            // Bouton Sign Up
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100, // Couleur plus claire pour Sign Up
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bords arrondis
                ),
                minimumSize: const Size(double.infinity, 50), // Bouton large
              ),
              onPressed: () {
                // Action pour Sign Up
                navTo(context, NewAccountPage());

              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2260FF), // Texte bleu vif
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Méthode pour naviguer vers une page
  void navTo(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}


