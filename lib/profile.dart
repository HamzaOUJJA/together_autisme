import 'package:flutter/material.dart';
import 'settings.dart';       // Import the other pages
import 'edit_profile.dart';
import 'privacy_policy.dart';
import 'help_center.dart';
import 'homepage.dart';      // Import homepage to navigate back



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfileWidget(),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  int _selectedIndex = 2; // Profile is the third item (index 2)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // Go back to the previous page
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navTo(context, EditProfilePage()); // Navigate to EditProfilePage
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.blue),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navTo(context, PrivacyPolicyPage()); // Navigate to PrivacyPolicyPage
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navTo(context, SettingsPage()); // Navigate to SettingsPage
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help, color: Colors.blue),
                  title: Text('Help Center'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    navTo(context, HelpCenterPage()); // Navigate to HelpCenterPage
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.blue),
                  title: Text('Logout'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Perform logout action
                  },
                ),
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
          switch (index) {
            case 0:
            // Navigate to HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;

            case 2:
            // Stay on ProfilePage
              break;
            case 3:
            // Navigate to Calendar (implement Calendar page accordingly)
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => CalendarPage()),
            // );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void navTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
