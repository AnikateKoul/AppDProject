import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'pages/LoginWithGoogle.dart';
import 'pages/homepage.dart';
import 'package:bordered_text/bordered_text.dart';
import 'pages/SignIn.dart';
import 'pages/home_screen.dart';
import 'pages/todo_list.dart';
import 'package:sign_in_with_google/pages/weather_report.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login' : (context) => const SignInWithG(),
        '/homepage' : (context) => const HomeScreen(),
        '/todo' : (context) =>  TodoList(),
        '/weather' : (context) => const WeatherReport(),
      },
      home: const SignInWithG(),
    );
  }
}

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/wave-lime.png'),
//             alignment: Alignment.topCenter,
//           ),
//         ),
//       ),
//       Container(
//         padding: const EdgeInsets.all(18),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/clip-996.png'),
//             // fit: BoxFit.cover,
//             alignment: Alignment(-1, 1.06),
//             // This align it Center Left + a little bit up
//           ),
//         ),
//       ),
//       const TextCard(
//         paddingValue: 150.0,
//         strokeWid: 4.0,
//         title: 'AGRI TECH',
//         titleLetterSpacing: 5.0,
//         titleFontSize: 50,
//         titleFontWeight: FontWeight.bold,
//         titleFont: 'Roboto',
//       ),
//       const TextCard(
//         paddingValue: 240.0,
//         strokeWid: 1,
//         title: 'A Smart Agriculture Application',
//         titleLetterSpacing: 2.0,
//         titleFontSize: 22.0,
//         titleFontWeight: FontWeight.normal,
//         titleFont: 'RobotoCondensed',
//       ),
//       Center(
//         child: ElevatedButton(
//             onPressed: () {
//
//             },
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.lime),
//               padding: MaterialStateProperty.all(
//                 const EdgeInsets.all(20),
//               ),
//             ),
//             child: BorderedText(
//               strokeWidth: 2.0,
//               strokeColor: Colors.black54,
//               child: const Text(
//                 'SIGN IN',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 3.0,
//                 ),
//               ),
//             )),
//       )
//     ]));
//   }
// }
//
// class TextCard extends StatelessWidget {
//   final double paddingValue;
//   final double strokeWid;
//   final String title;
//   final double titleLetterSpacing;
//   final double titleFontSize;
//   final FontWeight titleFontWeight;
//   final String titleFont;
//
//   const TextCard({
//     Key? key,
//     required this.paddingValue,
//     required this.strokeWid,
//     required this.title,
//     required this.titleLetterSpacing,
//     required this.titleFontSize,
//     required this.titleFontWeight,
//     required this.titleFont,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topCenter,
//       padding: EdgeInsets.only(top: paddingValue),
//       child: BorderedText(
//         strokeWidth: strokeWid,
//         strokeColor: Colors.black45,
//         child: Text(
//           title,
//           style: TextStyle(
//             color: Colors.lime,
//             letterSpacing: titleLetterSpacing,
//             fontWeight: titleFontWeight,
//             fontSize: titleFontSize,
//             fontFamily: titleFont,
//           ),
//         ),
//       ),
//     );
//   }
// }
