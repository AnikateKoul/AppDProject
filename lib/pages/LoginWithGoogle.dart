import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_in_with_google/pages/Homepage.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({Key? key}) : super(key: key);

  @override
  _LoginWithGoogleState createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  String? userEmail = "";
  String? userImageURL;

  @override
  Widget build(BuildContext context) {
    Widget returnProfileImage() {
      if (userImageURL == null) {
        return const Icon(
          Icons.account_circle,
          size: 100,
        );
      } else {
        return Image.network(userImageURL!, width: 100, height: 100);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("AppD"),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () async {
                await signInWithGoogle();
                setState(() {});
                Navigator.pushNamed(context, '/homepage');
              },
              child: const Text("Login")),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text("Welcome to Agricultural App"),
          const SizedBox(height: 10),
          returnProfileImage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("User email : "),
              Text(userEmail!),
            ],
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       await signInWithGoogle();
          //       setState(() {});
          //     },
          //     child: const Text("Login")),
          SizedBox.fromSize(size: const Size(10, 20)),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                userEmail = "";
                userImageURL = null;
                returnProfileImage();
                Fluttertoast.showToast(
                  msg: "Signed out successfully",
                  toastLength: Toast.LENGTH_SHORT,
                );
                await GoogleSignIn().signOut();
                setState(() {});
              },
              child: const Text("Logout")),
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    userEmail = googleUser?.email;
    userImageURL = googleUser?.photoUrl;
    print(userImageURL);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
