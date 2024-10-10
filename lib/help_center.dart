import 'package:flutter/material.dart';

class HelpCenterP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpCenterPage(),
    );
  }
}

class HelpCenterPage extends StatefulWidget {
  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  // Gestion de l'affichage du contenu des options
  bool _isCustomerServiceExpanded = false;
  bool _isWebsiteExpanded = false;
  bool _isFacebookExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centre d''Aide.'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action for back button
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue, // Fond bleu pour le header
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Comment pouvons-nous vous aider ?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Rechercher...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for FAQ
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        shape: StadiumBorder(),
                      ),
                      child: Text('FAQ'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Action for Contact Us
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      child: Text('Contactez-nous'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildHelpOption(
                  icon: Icons.headset_mic,
                  title: 'Service Client',
                  isExpanded: _isCustomerServiceExpanded,
                  onTap: () {
                    setState(() {
                      _isCustomerServiceExpanded = !_isCustomerServiceExpanded;
                    });
                  },
                ),
                _buildHelpOption(
                  icon: Icons.language,
                  title: 'Site Web',
                  isExpanded: _isWebsiteExpanded,
                  onTap: () {
                    setState(() {
                      _isWebsiteExpanded = !_isWebsiteExpanded;
                    });
                  },
                ),
                _buildHelpOption(
                  icon: Icons.facebook,
                  title: 'Facebook',
                  isExpanded: _isFacebookExpanded,
                  onTap: () {
                    setState(() {
                      _isFacebookExpanded = !_isFacebookExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpOption({
    required IconData icon,
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(title),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.blue,
          ),
          onTap: onTap,
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Here is more information about $title.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        Divider(),
      ],
    );
  }
}
