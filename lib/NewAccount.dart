import 'package:flutter/material.dart';




class NewAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: 'LeagueSpartan'),
        ),
      ),
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isParentSelected = true;
  bool isProfessionalSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60), // Espace en haut
              Center(
                child: Text(
                  'New Account',
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 24,
                    fontWeight: FontWeight.bold, // Titre en gras
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildLabelText('Full name'),
              _buildTextField('your name'),
              SizedBox(height: 20),
              _buildLabelText('Password'),
              _buildPasswordField(),
              SizedBox(height: 20),
              _buildLabelText('Email'),
              _buildTextField('example@example.com'),
              SizedBox(height: 20),
              _buildLabelText('Mobile Number'),
              _buildTextField('+33******'),
              SizedBox(height: 20),
              _buildLabelText('Date Of Birth'),
              _buildTextField('DD / MM /YYYY'),
              SizedBox(height: 20),
              Text(
                'Register As',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Titre en gras
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              SizedBox(height: 10),
              _buildRoleSelection(),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Text(
                      'By continuing, you agree to',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'LeagueSpartan',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms of Use',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.bold, // Titre en gras
                          ),
                        ),
                        Text(' and '),
                        Text(
                          'Privacy Policy.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.bold, // Titre en gras
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'LeagueSpartan',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'or sign up with',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.g_mobiledata),
                    SizedBox(width: 20),
                    _buildSocialIcon(Icons.facebook),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Redirection vers la page de login
                  },
                  child: Text(
                    'already have an account? Log in',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'LeagueSpartan',
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

  Widget _buildLabelText(String label) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.bold, // Titres en gras
        fontFamily: 'LeagueSpartan',
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.blue.shade200,
          fontFamily: 'LeagueSpartan',
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: '************',
        hintStyle: TextStyle(
          color: Colors.blue.shade200,
          fontFamily: 'LeagueSpartan',
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.visibility_off),
      ),
    );
  }

  Widget _buildRoleSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isParentSelected = true;
              isProfessionalSelected = false;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: isParentSelected ? Colors.blue : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Parents',
              style: TextStyle(
                color: isParentSelected ? Colors.white : Colors.blue,
                fontFamily: 'LeagueSpartan',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isParentSelected = false;
              isProfessionalSelected = true;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: isProfessionalSelected ? Colors.blue : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Professional',
              style: TextStyle(
                color: isProfessionalSelected ? Colors.white : Colors.blue,
                fontFamily: 'LeagueSpartan',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.blue.shade100,
      child: Icon(icon, color: Colors.blue, size: 30),
    );
  }
}
