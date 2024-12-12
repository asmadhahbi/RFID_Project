import 'package:flutter/material.dart';
import 'package:proj_archi/editprofile.dart';
import 'package:proj_archi/history.dart';

class AccessListScreen extends StatefulWidget {
  const AccessListScreen({Key? key}) : super(key: key);

  @override
  _AccessListScreenState createState() => _AccessListScreenState();
}

class _AccessListScreenState extends State<AccessListScreen> {
  // Liste initiale des utilisateurs
  List<Map<String, String>> users = [
    {'name': 'Rim Chaab', 'id': '1'},
    {'name': 'Sami Khefi', 'id': '2'},
    {'name': 'Ali Bourouba', 'id': '3'},
  ];

  // Fonction pour ajouter un utilisateur
  void _addUser() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String id = '';
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: const [
              Icon(
                Icons.person_add,
                color: const Color.fromARGB(255, 187, 132, 232),
              ),
              SizedBox(width: 8),
              Text('Add User'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'ID',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => id = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && id.isNotEmpty) {
                  setState(() {
                    users.add({'name': name, 'id': id});
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add User'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Fonction pour confirmer la suppression d'un utilisateur
  void _confirmDeleteUser(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: const [
              Icon(Icons.warning, color: Colors.red),
              SizedBox(width: 8),
              Text('Confirm User Deletion'),
            ],
          ),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  users.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text('YES'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access List'),
      ),
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
                Navigator.pop(context); // Fermer le drawer
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryScreen()));
                // Naviguer vers l'écran Historique
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search user',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 187, 132, 232),
                    child: Text(
                      users[index]['name']![0]
                          .toUpperCase(), // La première lettre du nom de l'utilisateur
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(users[index]['name']!),
                  subtitle: Text('ID: ${users[index]['id']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _confirmDeleteUser(index); // Confirmation de suppression
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser, // Ajouter un utilisateur
        child: const Icon(Icons.add),
      ),
    );
  }
}
