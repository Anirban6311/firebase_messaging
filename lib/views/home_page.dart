import 'package:flutter/material.dart';

import '../controllers/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home Page")),
        backgroundColor: Colors.greenAccent,
        actions: [
          ElevatedButton(
              onPressed: () {
                AuthService.logout().then((val) {
                  try {
                    if (val == "Logged Out") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Logged Out Successfully")));
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login", (route) => false);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                });
              },
              child: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
