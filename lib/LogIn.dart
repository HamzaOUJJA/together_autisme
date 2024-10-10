import 'package:flutter/material.dart';
import 'homepage.dart'; // Import the HomePage

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage(); // Return LoginPage directly
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        centerTitle: true,
        title: const Text(
          'Log In',
          style: TextStyle(
            color: Color(0xFF2260FF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF5F9FF), // Light blue
              Color(0xFFFAFCFF), // Almost white for a clean effect
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2260FF),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Grâce à notre interface intuitive, suivez vos progrès, accédez aux recommandations d’un thérapeute et engagez-vous dans des activités adaptées pour favoriser l’autonomie et le bien-être.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: 'example@example.com or mobile',
                  hintStyle: TextStyle(color: Colors.blue.shade200),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Mot de passe',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: '***********',
                  hintStyle: TextStyle(color: Colors.blue.shade200),
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Action pour "Forget Password"
                  },
                  child: const Text(
                    'Mot de passe oublié?',
                    style: TextStyle(
                      color: Color(0xFF2260FF),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2260FF),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  elevation: 3,
                ),
                onPressed: () {
                  // Navigate to HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Text(
                  'Se connecter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Ou se connecter avec',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Icon
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade50,
                    child: IconButton(
                      icon: Icon(Icons.g_mobiledata, color: Color(0xFF2260FF)),
                      onPressed: () {
                        // Action pour Google
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Facebook Icon
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade50,
                    child: IconButton(
                      icon: Icon(Icons.facebook, color: Color(0xFF2260FF)),
                      onPressed: () {
                        // Action pour Facebook
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Fingerprint Icon
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade50,
                    child: IconButton(
                      icon: Icon(Icons.fingerprint, color: Color(0xFF2260FF)),
                      onPressed: () {
                        // Action pour empreinte digitale
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Action pour Sign Up
                  },
                  child: const Text(
                    "Pas de compte ? S'inscrire",
                    style: TextStyle(
                      color: Color(0xFF2260FF),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
