import 'package:flutter/material.dart';


void main() {
  runApp(SettingPage());
}


class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Notification Setting
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: Colors.blueAccent),
            title: Text('Notification Setting'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
            onTap: () {
              // Handle tap action
            },
          ),
          Divider(),

          // Password Manager
          ListTile(
            leading: Icon(Icons.vpn_key, color: Colors.blueAccent),
            title: Text('Password Manager'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
            onTap: () {
              // Handle tap action
            },
          ),
          Divider(),

          // Delete Account
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.blueAccent),
            title: Text('Delete Account'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
            onTap: () {
              // Handle tap action
            },
          ),
        ],
      ),
    );
  }
}
