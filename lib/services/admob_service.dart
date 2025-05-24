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
