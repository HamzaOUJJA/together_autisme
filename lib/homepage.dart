import 'package:flutter/material.dart';

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

  final Color blueColor = Color(0xFF0056D2); // Couleur bleue pour le design
  final Color lightBlueColor = Color(0xFF157AFF); // Couleur bleue claire

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
                Icon(Icons.school, color: blueColor),
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
            icon: Icon(Icons.notifications_none, color: blueColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined, color: blueColor),
            onPressed: () {},
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
              padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 10),
              children: [
                // Example of a card item
                Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: lightBlueColor,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text('Student 1'),
                    subtitle: Text('Grade: A'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Action on tap
                    },
                  ),
                ),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: lightBlueColor,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text('Student 2'),
                    subtitle: Text('Grade: B'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Action on tap
                    },
                  ),
                ),
                // Add more card items as needed
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: blueColor,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }

  Widget _buildSwitchButton(String title, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? blueColor : Colors.grey[300], // Button color based on selection
        foregroundColor: isSelected ? Colors.white : Colors.black, // Text color based on selection
      ),
      onPressed: () {
        setState(() {
          _isStudentSelected = title == "Student"; // Update selection state
        });
      },
      child: Text(title),
    );
  }
}
