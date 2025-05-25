import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static RewardedAd? _rewardedAd;

  static void initialize() {
    MobileAds.instance.initialize();
  }

  static Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // ID de prueba oficial
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
          print("Ad load failed: \$error");
        },
      ),
    );
  }

  static Future<bool> showRewardedAd() async {
    if (_rewardedAd == null) {
      await loadRewardedAd();
    }

    if (_rewardedAd != null) {
      bool completed = false;
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) => ad.dispose(),
        onAdFailedToShowFullScreenContent: (ad, error) => ad.dispose(),
      );
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          completed = true;
        },
      );
      return completed;
    }
    return false;
  }
}