import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[600],
      child: ListView(
        padding: padding,
        children: [
          const SizedBox(
            height: 48,
          ),
          buildMenuItem(
            text: 'People',
            icon: Icons.people,
          ),
          const SizedBox(
            height: 18,
          ),
          buildMenuItem(text: 'Favourites', icon: Icons.favorite_border),
          const SizedBox(
            height: 18,
          ),
          buildMenuItem(text: 'Workflow', icon: Icons.workspaces_outline),
          const SizedBox(
            height: 18,
          ),
          buildMenuItem(text: 'Updates', icon: Icons.update),
          const SizedBox(
            height: 24,
          ),
          const Divider(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 24,
          ),
          buildMenuItem(text: 'Plugins', icon: Icons.account_tree_outlined),
          const SizedBox(
            height: 18,
          ),
          buildMenuItem(text: 'Sign Out', icon: Icons.logout_rounded,
            onClicked: () async {
              await FirebaseAuth.instance.signOut();
              // userEmail = "";
              // userImageURL = null;
              // userName = "Login";
              // // returnProfileImage();
              // showFlutterToast();
              await GoogleSignIn().signOut();
              setState(() {});
              Navigator.pushReplacementNamed(context, '/login');
            },),
        ],
      ),
    );
  }
}


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      onTap: onClicked,
    );
  }

