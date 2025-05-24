import 'package:flutter/material.dart';
import 'routes/routes.dart';

class TermuxScriptsApp extends StatelessWidget {
  const TermuxScriptsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Termux Scripts PRO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.tealAccent,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}