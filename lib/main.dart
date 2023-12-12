import 'dart:io';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;
  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  @override
  void initState() {
    super.initState();

    /// please add your own device testingId
    /// (testingId will print in console if you don't provide  )
    FacebookAudienceNetwork.init(
      //this parameer use when tesing perform
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      iOSAdvertiserTrackingEnabled: true,
    );

    // _loadInterstitialAd();
    // _loadRewardedVideoAd();
  }

  // void _loadInterstitialAd() {
  //   FacebookInterstitialAd.loadInterstitialAd(
  //     //this is your placement id how it create we will show in end of video
  //     placementId: Platform.isAndroid
  //         ? "876616926981816_876617470315095"
  //         : "ios placement id",
  //     //this is listerner
  //     listener: (result, value) {
  //       print(">> FAN > Interstitial Ad: $result --> $value");
  //       if (result == InterstitialAdResult.LOADED)
  //         _isInterstitialAdLoaded = true;

  //       /// Once an Interstitial Ad has been dismissed and becomes invalidated,
  //       /// load a fresh Ad by calling this function.
  //       if (result == InterstitialAdResult.DISMISSED &&
  //           value["invalidated"] == true) {
  //         _isInterstitialAdLoaded = false;
  //         _loadInterstitialAd();
  //       }
  //     },
  //   );
  // }

  // void _loadRewardedVideoAd() {
  //   FacebookRewardedVideoAd.loadRewardedVideoAd(
  //     //rewarded need original ad id
  //     placementId: "876616926981816_876617673648408",
  //     listener: (result, value) {
  //       print("Rewarded Ad: $result --> $value");
  //       if (result == RewardedVideoAdResult.LOADED) _isRewardedAdLoaded = true;
  //       if (result == RewardedVideoAdResult.VIDEO_COMPLETE)

  //       /// Once a Rewarded Ad has been closed and becomes invalidated,
  //       /// load a fresh Ad by calling this function.
  //       if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
  //           (value == true || value["invalidated"] == true)) {
  //         _isRewardedAdLoaded = false;
  //         _loadRewardedVideoAd();
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(onPressed: () {}, child: const Text('int')),
                  TextButton(onPressed: () {}, child: const Text('rew')),
                  TextButton(onPressed: () {}, child: const Text('native')),
                  TextButton(
                      onPressed: () {}, child: const Text('nativebanner')),
                  TextButton(onPressed: () {}, child: const Text('banner')),
                ],
              ),
            ),
            Expanded(
              child: FacebookBannerAd(
                // placementId: "YOUR_PLACEMENT_ID",
                placementId:
                    "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047", //testid
                //size of banner ad
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {
                  print("Banner Ad: $result -->  $value");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // _showInterstitialAd() {
  //   if (_isInterstitialAdLoaded == true)
  //     //we loaded at initstate we just show it
  //     FacebookInterstitialAd.showInterstitialAd();
  //   else
  //     print("Interstial Ad not yet loaded!");
  // }

  // _showRewardedAd() {
  //   if (_isRewardedAdLoaded == true)
  //     FacebookRewardedVideoAd.showRewardedVideoAd();
  //   else
  //     print("Rewarded Ad not yet loaded!");
  // }

  _showBannerAd() {
    setState(() {
      _currentAd = FacebookBannerAd(
        // placementId: "YOUR_PLACEMENT_ID",
        placementId: "876616926981816_876617423648433", //testid
        //size of banner ad
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          print("Banner Ad: $result -->  $value");
        },
      );
    });
  }

  // _showNativeBannerAd() {
  //   setState(() {
  //     _currentAd = _nativeBannerAd();
  //   });
  // }

  // Widget _nativeBannerAd() {
  //   return FacebookNativeAd(
  //     // placementId: "YOUR_PLACEMENT_ID",
  //     //just use type a bannertype
  //     placementId: "876616926981816_876617780315064",
  //     adType: NativeAdType.NATIVE_BANNER_AD,
  //     bannerAdSize: NativeBannerAdSize.HEIGHT_100,
  //     width: double.infinity,
  //     backgroundColor: Colors.blue,
  //     titleColor: Colors.white,
  //     descriptionColor: Colors.white,
  //     buttonColor: Colors.deepPurple,
  //     buttonTitleColor: Colors.white,
  //     buttonBorderColor: Colors.white,
  //     listener: (result, value) {
  //       print("Native Banner Ad: $result --> $value");
  //     },
  //   );
  // }

  // _showNativeAd() {
  //   setState(() {
  //     _currentAd = _nativeAd();
  //   });
  // }

  // Widget _nativeAd() {
  //   return FacebookNativeAd(
  //     placementId: "876616926981816_876617780315064",
  //     adType: NativeAdType.NATIVE_AD_VERTICAL,
  //     width: double.infinity,
  //     height: 300,
  //     backgroundColor: Colors.red,
  //     titleColor: Colors.black,
  //     descriptionColor: Colors.black,
  //     buttonColor: Colors.blue,
  //     buttonTitleColor: Colors.black,
  //     buttonBorderColor: Colors.black,
  //     listener: (result, value) {
  //       print("Native Ad: $result --> $value");
  //     },
  //     keepExpandedWhileLoading: true,
  //     expandAnimationDuraion: 1000,
  //   );
  // }
}
