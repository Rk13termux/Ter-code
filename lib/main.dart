import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app.dart';

Future<void> main() async {
  // Asegura que Flutter esté inicializado correctamente
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa AdMob
  await MobileAds.instance.initialize();

  // Puedes inicializar Firebase aquí en el futuro:
  // await Firebase.initializeApp();

  runApp(const TermuxScriptsApp());
}