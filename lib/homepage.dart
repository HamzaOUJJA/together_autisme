import 'package:flutter/material.dart';
import 'settings_notifications.dart'; // Import for settings page
import 'profile.dart'; // Import for profile page



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isStudentSelected = true; // État pour savoir quel bouton est sélectionné

  final Color primaryBlue = Color(0xFF0056D2); // Couleur bleue pour le design
  final Color lightBlue = Color(0xFF157AFF); // Couleur bleue claire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Espace ajouté en haut
            Row(
              children: [
                Icon(Icons.school, color: primaryBlue),
                SizedBox(width: 10),
                Text(
                  'Primary School Jean Baptiste',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20, // Taille de la police augmentée
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              '123 Rue de l\'Éducation, Paris, France',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            Text(
              'Téléphone: +33 1 23 45 67 89',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            Text(
              '"Pour un avenir meilleur"',
              style: TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: primaryBlue),
            onPressed: () {
              // Navigate to settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingNotifPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined, color: primaryBlue),
            onPressed: () {
              // Navigate to settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingNotifPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSwitchButton("Student", _isStudentSelected),
                _buildSwitchButton("Team", !_isStudentSelected),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 10.0), // Réduction de 10 pixels en bas
              children: [
                if (_isStudentSelected) ...[
                  _buildStudentCard("Nathalie DUBOIS", "7 ans", "CE1"),
                  _buildStudentCard("Alexander Bennett", "8 ans", "CE2"),
                  _buildStudentCard("Sophia Martinez", "6 ans", "CP"),
                ] else ...[
                  _buildTeamCard("John DOE", "Enseignant", "Mathématiques"),
                  _buildTeamCard("Emma SMITH", "Directrice", "Gestion"),
                ],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 2) {
            // Navigate to Profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
        ],
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildSwitchButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isStudentSelected = text == "Student"; // Met à jour l'état en fonction du bouton cliqué
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isSelected ? primaryBlue : Colors.grey[200],
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: isSelected
                ? [BoxShadow(color: primaryBlue.withOpacity(0.4), blurRadius: 10.0, offset: Offset(0, 5))]
                : [],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStudentCard(String name, String age, String grade) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        shadowColor: primaryBlue.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: primaryBlue.withOpacity(0.2),
                    child: Icon(Icons.person, color: primaryBlue, size: 40),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '$age - $grade',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.settings, color: primaryBlue),
                    onPressed: () {
                      // Action pour ouvrir les paramètres de l'étudiant
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton("View Profile", primaryBlue),
                  SizedBox(width: 8.0),
                  _buildActionButton("Follow Up", lightBlue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamCard(String name, String role, String subject) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        shadowColor: primaryBlue.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: primaryBlue.withOpacity(0.2),
                    child: Icon(Icons.person, color: primaryBlue, size: 40),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '$role - $subject',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.settings, color: primaryBlue),
                    onPressed: () {
                      // Action pour ouvrir les paramètres de l'équipe
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton("View Profile", primaryBlue),
                  SizedBox(width: 8.0),
                  _buildActionButton("Follow Up", lightBlue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
