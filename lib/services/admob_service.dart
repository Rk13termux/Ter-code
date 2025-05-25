import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static RewardedAd? _rewardedAd;

  static void initialize() {
    MobileAds.instance.initialize();
  }

  static Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // ID de prueba
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
          print("Falló la carga del anuncio: \$error");
        },
      ),
    );
  }

  static Future<bool> showRewardedAd() async {
    final completer = Completer<bool>();

    if (_rewardedAd == null) {
      await loadRewardedAd();
    }

    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          if (!completer.isCompleted) completer.complete(false);
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          if (!completer.isCompleted) completer.complete(false);
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          if (!completer.isCompleted) completer.complete(true);
        },
      );

      return completer.future;
    }

    return false;
  }
}