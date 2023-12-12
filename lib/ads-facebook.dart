import 'dart:io';

class AdHelper {
  static String get bannerAds {
    if (Platform.isAndroid) {
      return "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativebannerAds {
    if (Platform.isAndroid) {
      return "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAds {
    if (Platform.isAndroid) {
      return "IMG_16_9_APP_INSTALL#2312433698835503_2964952163583650";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAds {
    if (Platform.isAndroid) {
      return "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-3940256099942544/5135589807";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
