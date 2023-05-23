import 'package:blogger_dot/pages/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(
      Theme.of(context).textTheme,
    )
    
  ),
      home: WelcomePage(),
    );
  }
}
