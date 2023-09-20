import 'package:flutter/material.dart';
import 'package:wallpaper_app/splash_screen.dart';
import 'package:wallpaper_app/wallpaper_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: SplashScreen(),
    );
  }
}
