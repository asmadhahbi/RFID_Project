import 'package:flutter/material.dart';
import 'package:proj_archi/AccessList.dart';
import 'package:proj_archi/editprofile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemple de données d'historique
    final List<Map<String, String>> history = [
      {'name': 'John Doe', 'id': '001'},
      {'name': 'Unknown', 'id': '002'},
      {'name': 'Jane Smith', 'id': '003'},
      {'name': 'Unknown', 'id': '004'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Access History')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 187, 132, 232),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Access List'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AccessListScreen())); // Fermer le drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()));
                // Naviguer vers l'écran Profil
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Navigator.pop(context);
                // Naviguer vers l'écran Historique
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final person = history[index];
          return ListTile(
            leading: Icon(
              person['name'] == 'Unknown' ? Icons.error : Icons.person,
              color: person['name'] == 'Unknown' ? Colors.red : Colors.green,
            ),
            title: Text(person['name']!),
            subtitle: Text('ID: ${person['id']}'),
          );
        },
      ),
    );
  }
}
