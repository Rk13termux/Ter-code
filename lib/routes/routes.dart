import 'package:flutter/material.dart'; // NECESARIO
import '../screens/home_screen.dart';
import '../screens/script_list_screen.dart';
import '../screens/script_view_screen.dart';
import '../screens/pro_unlock_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/scripts': (context) => const ScriptListScreen(),
  '/view': (context) => const ScriptViewScreen(),
  '/pro': (context) => const ProUnlockScreen(),
};