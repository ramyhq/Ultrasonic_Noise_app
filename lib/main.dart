// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ultrasonic_noise/helpers/adsManger.dart';
import 'package:wakelock/wakelock.dart';
import 'const.dart';
import 'models/20hz_generator.dart';


void main() {
  //------- AdMobAds -----------
  WidgetsFlutterBinding.ensureInitialized();
  final adInitialize = MobileAds.instance.initialize();
  final adManger = AdsManager(initialization: adInitialize);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light
  ));

  runApp(Provider.value(
    value: adManger,
      child: MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Wakelock.enable(); // to keep screen always awake
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultra Sonic',
      home: MainPage(),
    );
  }
}
