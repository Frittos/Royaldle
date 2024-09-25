import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royaldle/routes.dart';
import 'package:royaldle/screens/connectivity_checker.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: const FirebaseOptions(
       apiKey: "AIzaSyC5DwK_PQNydNPtVX3IFNQ2W-5e1oPjtTU", // paste your api key here
       appId: "1:829626636399:android:d36479eba9d5199071959a", //paste your app id here
       messagingSenderId: "829626636399", //paste your messagingSenderId here
       projectId: "royaldle", //paste your project id here
     ),
   );
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home : const ConnectivityChecker(),
      routes: routes,
    );
  }
}