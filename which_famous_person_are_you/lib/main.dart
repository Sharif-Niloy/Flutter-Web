import 'package:flutter/material.dart';
import 'package:which_famous_person_are_you/view/screen_splash_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Which Famous Person Are You ?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoadingScreen(),
    );
  }
}
