import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/constants.dart';
import 'screens/home_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        fontFamily: GoogleFonts.inter().fontFamily,
        scaffoldBackgroundColor: neutralColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: neutralColor,
          elevation: 0,
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          titleMedium: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          titleSmall: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 10,
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
          bodySmall: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
