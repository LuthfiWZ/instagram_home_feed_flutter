import 'package:flutter/material.dart';
import 'pages/instagram_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const InstagramHomePage(),
    );
  }
}