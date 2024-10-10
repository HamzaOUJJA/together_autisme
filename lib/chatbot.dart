import 'package:flutter/material.dart';

void main() {
  runApp(SimpleChatBotPage());
}



class SimpleChatBotPage extends StatefulWidget {
  @override
  _SimpleChatBotPageState createState() => _SimpleChatBotPageState();
}

class _SimpleChatBotPageState extends State<SimpleChatBotPage> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  // Fonction de réponse prédéfinie du chatbot
  String _getBotResponse(String message) {
    message = message.toLowerCase();

    if (message.contains('bonjour')) {
      return 'Bonjour ! Comment puis-je vous aider aujourd\'hui ?';
    } else if (message.contains('autisme')) {
      return 'L\'autisme est un trouble du développement. Que voulez-vous savoir à ce sujet ?';
    } else if (message.contains('merci')) {
      return 'De rien ! Si vous avez d\'autres questions, n\'hésitez pas.';
    } else {
      return 'Je suis désolé, je ne comprends pas votre question. Pouvez-vous reformuler ?';
    }
  }

  void _sendMessage(String message) {
    if (message.isEmpty) return;

    setState(() {
      // Ajouter le message utilisateur à la liste
      _messages.add({'text': message, 'sender': 'user'});

      // Obtenir la réponse du bot
      String botResponse = _getBotResponse(message);

      // Ajouter la réponse du bot à la liste
      _messages.add({'text': botResponse, 'sender': 'bot'});
    });

    // Effacer le champ de texte après envoi
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Column(
        children: <Widget>[
          // Afficher les messages dans une liste
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Colors.blue[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(message['text']!),
                    ),
                  ),
                );
              },
            ),
          ),
          // Champ de saisie de texte et bouton d'envoi
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Tapez un message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
