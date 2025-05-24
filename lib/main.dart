// main.dart
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const TermuxScriptsApp());
}

// admob_service.dart
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static RewardedAd? _rewardedAd;

  static void loadRewardedAd(Function onReward) {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // ID de prueba
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) => ad.dispose(),
            onAdFailedToShowFullScreenContent: (ad, error) => ad.dispose(),
          );
          _rewardedAd!.show(
            onUserEarnedReward: (ad, reward) => onReward(),
          );
          _rewardedAd = null;
        },
        onAdFailedToLoad: (error) {
          print('Error al cargar el anuncio: \$error');
        },
      ),
    );
  }
}

// app.dart
import 'package:flutter/material.dart';
import 'routes/routes.dart';

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
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            textStyle: TextStyle(
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
        listTileTheme: ListTileThemeData(
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
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
