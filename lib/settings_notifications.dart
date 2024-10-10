import 'package:flutter/material.dart';



class SettingNotifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Settings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationSettingsPage(),
    );
  }
}

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _generalNotification = true;
  bool _sound = true;
  bool _vibrate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Setting'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // General Notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('General Notification'),
                Switch(
                  value: _generalNotification,
                  onChanged: (bool value) {
                    setState(() {
                      _generalNotification = value;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
              ],
            ),
            Divider(),

            // Sound
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sound'),
                Switch(
                  value: _sound,
                  onChanged: (bool value) {
                    setState(() {
                      _sound = value;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
              ],
            ),
            Divider(),

            // Vibrate
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vibrate'),
                Switch(
                  value: _vibrate,
                  onChanged: (bool value) {
                    setState(() {
                      _vibrate = value;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
