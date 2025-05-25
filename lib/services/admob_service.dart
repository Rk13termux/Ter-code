import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static RewardedAd? _rewardedAd;

  static void initialize() {
    MobileAds.instance.initialize();
  }

  static Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: RewardedAd.testAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (error) => _rewardedAd = null,
      ),
    );
  }

  static Future<bool> showRewardedAd() async {
    if (_rewardedAd == null) {
      await loadRewardedAd();
    }

    if (_rewardedAd != null) {
      bool completed = false;
      await _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          completed = true;
        },
      );
      return completed;
    }
    return false;
  }
}