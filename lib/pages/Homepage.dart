import 'package:flutter/material.dart';
import 'package:sign_in_with_google/pages/LoginWithGoogle.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agri Tech"),
        actions: const[
            Icon(Icons.account_circle),
        ],
      ),
      body: Text("Hello World"),
    );
  }
}
