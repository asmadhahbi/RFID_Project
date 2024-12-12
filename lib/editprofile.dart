import 'package:flutter/material.dart';
import 'package:proj_archi/AccessList.dart';
import 'package:proj_archi/history.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
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
                Navigator.pop(context);
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_placeholder.png'), // Replace with user image
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Change Picture'),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Email Id'),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 187, 132, 232), // Couleur de fond du bouton
                foregroundColor: Colors.white, // Couleur du texte ou de l'icône
                padding: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 16.0), // Taille du bouton
                textStyle: const TextStyle(
                  fontSize: 18, // Taille du texte
                  fontWeight: FontWeight.bold, // Style du texte
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Coins arrondis
                ),
              ),
              onPressed: () {},
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
