import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static final AdRequest _request = AdRequest();

  static InterstitialAd? _interstitialAd;

  static Future<void> showInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX', // Reemplaza con tu ID real
      request: _request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              ad.dispose();
            },
          );
          _interstitialAd!.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Error al cargar InterstitialAd: $error');
        },
      ),
    );
  }
}