import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'screens/welcome_screen.dart';

class TermuxScriptsApp extends StatelessWidget {
  const TermuxScriptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Termux Scripts PRO',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Courier',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.redAccent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
            fontFamily: 'Courier',
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70, fontFamily: 'Courier'),
          bodyMedium: TextStyle(color: Colors.white60, fontFamily: 'Courier'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.redAccent,
          textColor: Colors.white,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.redAccent,
            side: const BorderSide(color: Colors.redAccent),
          ),
        ),
      ),
      home: const WelcomeScreen(),
      routes: appRoutes,
    );
  }
}