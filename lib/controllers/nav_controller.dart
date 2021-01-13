import 'package:get/get.dart';
import 'package:firebase_admob/firebase_admob.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;
  BannerAd myBanner;

  changeIndex(index) {
    selectedIndex.value = index;
    if (index != 0) {
      myBanner.dispose();
    }
  }

  @override
  void onInit() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      birthday: DateTime.now(),
      childDirected: false,
      designedForFamilies: false,
      gender: MobileAdGender
          .male, // or MobileAdGender.female, MobileAdGender.unknown
      testDevices: <String>[], // Android emulators are considered test devices
    );
    myBanner = BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,

      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
    myBanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 60.0,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        horizontalCenterOffset: 10.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );
    super.onInit();
  }

  @override
  void onClose() {
    myBanner.dispose();
    // TODO: implement onClose
    print("dispose 1");

    super.onClose();
  }
}
