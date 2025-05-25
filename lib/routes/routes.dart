
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/script_list_screen.dart';
import '../screens/script_detail_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/scripts': (context) => const ScriptListScreen(),
  '/script': (context) => const ScriptDetailScreen(),
};
