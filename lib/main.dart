import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase_repository.dart';
import 'package:skype_clone/screens/login_screen.dart';
import 'package:skype_clone/screens/search_screen.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Skype Clone",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/search_screen': (context) => SearchScreen(),
      },
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
