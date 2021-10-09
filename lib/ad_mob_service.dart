import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService{

	static String get bannerAdUnitId => Platform.isAndroid
	? 'ca-app-pub-4597562367977617/2624474045'
	: 'ca-app-pub-4597562367977617/2624474045';
	
 	static initialize(){
		if(MobileAds.instance == null){
			MobileAds.instance.initialize();
		}
	}

  static BannerAd createBannerAd(){
    BannerAd ad = new BannerAd(
      adUnitId : bannerAdUnitId,
      size : AdSize.banner,
      request : AdRequest(),
      listener : BannerAdListener(
        onAdClosed : (Ad ad) => print("Ad loaded"),
        onAdFailedToLoad : (Ad ad, LoadAdError error){
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print("Ad opened"),
      )
    );
    return ad;
  }

}