// ignore_for_file: file_names, prefer_const_constructors
//dart 2.0
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:sound_generator/sound_generator.dart';
import 'package:ultrasonic_noise/helpers/adsManger.dart';
import 'package:ultrasonic_noise/models/ripple_animation.dart';
import '../const.dart';
import '../layouts/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPlaying = false;
  double frequency = 30000;
  double volume = 0.50;
  int sampleRate = 96000;
  String moodName = '';
  late List<int> oneCycleData;
  String moodTitle = 'طارد الفئران';
  bool isOn = false;

  ///------- AdMobAds -----------
  BannerAd? _bottomBannerAd;
  bool isLoaded = false;
  late AdsManager adManager;

  void getBottomBannerAd(AdsManager adManager) {
    _bottomBannerAd = BannerAd(
      adUnitId: adManager.bannerAdUnitId,
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoaded = true;
            print('Ad loaded to load: $isLoaded !!!!!!');
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          //ad.dispose();
          print('Ad failed to load: $error');
        },
      ),
    )..load();
  }

  Widget showAd() {
    return isLoaded
        ? Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, ),
        color: Color(0xffffcc00),
      ),
      alignment: Alignment.center,
      height: _bottomBannerAd!.size.height.toDouble() ,
      width: _bottomBannerAd!.size.width.toDouble(),
      child: AdWidget(ad: _bottomBannerAd!),
    )
        : Container(
      color: Color(0xffffcc00),
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
    );
  }
//------- AdMobAds -----------

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//------- AdMobAds -----------
    adManager = Provider.of<AdsManager>(context);
    adManager.initialization.then((value) {
      getBottomBannerAd(adManager);
    });
    //------- AdMobAds -----------
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _bottomBannerAd!.dispose(); //------- AdMobAds -----------
  // }


  String getMoodName() {
    if (frequency >= 10000 && frequency < 20000) {
      moodName = 'القطط';
    } else if (frequency >= 20000 && frequency < 30000) {
      moodName = 'الحشرات';
    } else if (frequency >= 30000 && frequency < 40000) {
      moodName = 'الفئران';
    } else if (frequency >= 40000 && frequency < 50000) {
      moodName = 'الكلاب';
    }
    ;
    return moodName;
  }

  String getRangeLevel() {
    if (volume >= 0.00 && volume < 0.25) {
      moodName = '٠ متر';
    } else if (volume >= 0.25 && volume < 0.50) {
      moodName = '٥ متر';
    } else if (volume >= 0.50 && volume < 0.75) {
      moodName = '١٠ متر';
    } else if (volume >= 0.75 && volume < 1.00) {
      moodName = '١٥ متر';
    } else if (volume >= 1.00 && volume < 2.0) {
      moodName = '٢٠ متر';
    }
    return moodName;
  }

  @override
  Widget build(BuildContext context) {
    Icon theIcone = Icon(
      Icons.power_settings_new,
      size: 100,
      color: isOn ? Colors.red : Colors.black87,
    );
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      //bottomNavigationBar: showAd(),
      backgroundColor: appBackGroundColor1,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'طارد الفئران بالتراسونك',
          style: kAppBarTitle,
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: ListView(
        shrinkWrap: true,
        reverse: false,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              showAd(), /// The Ad Widget
              Padding(
                padding: const EdgeInsets.only(top: 20.0,),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                        width: h / 2.0,
                        height: 1,
                        child: isPlaying ? RippleAnimatedButton(
                          child: Container(),
                            volume:volume) :Container(),),
                    Image.asset(
                      'assets/images/mood${(frequency / 10000).round().toString()}.png',
                      width: w / 2,
                      height: w / 2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      ListTile(
                        title: Text(
                          " وضع : " + getMoodName(),
                          style: kListTitle,
                            textAlign: TextAlign.center,
                        ),

                        subtitle: Text(
                            "الانسان لا يسطيع سماع الصوت فوق تردد ٢٠ الف هيرتز",
                            style: kListsubtile,
                            textAlign: TextAlign.center),
                      ),
                      Container(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      this.frequency.toStringAsFixed(2) + " Hz",
                                      style: kSliderValue,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8, // 60%
                                  child: SliderTheme(
                                    data: sliderTheme,
                                    child: Slider(
                                      divisions: 3,
                                      label: getMoodName(),
                                      min: 10000,
                                      max: 40000,
                                      value: this.frequency,
                                      onChanged: (_value) {
                                        setState(() {
                                          this.frequency = _value.toDouble();
                                          SoundGenerator.setFrequency(
                                              this.frequency);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ])),
                      Divider(
                        color: Color(0xffffffff),
                        // indent: w / 6,
                        // endIndent: w / 6,
                        thickness: 01,
                      ),
                      ListTile(
                        title: Text("مدي الاشارة",
                            style: kListTitle, textAlign: TextAlign.center),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  getRangeLevel(),
                                  style: kSliderValue2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8, // 60%
                              child: SliderTheme(
                                data: sliderTheme,
                                child: Slider(
                                  divisions: 4,
                                  label: getRangeLevel(),
                                  min: 0,
                                  max: 1,
                                  value: this.volume,
                                  onChanged: (_value) {
                                    setState(() {
                                      this.volume = _value.toDouble();
                                      SoundGenerator.setVolume(this.volume);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOn = !isOn;
                      isPlaying ? SoundGenerator.stop() : SoundGenerator.play();
                    });
                  },
                  child: theIcone,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SoundGenerator.release();
    _bottomBannerAd!.dispose(); //------- AdMobAds -----------

  }

  @override
  void initState() {
    super.initState();
    isPlaying = false;

    SoundGenerator.init(sampleRate);
    SoundGenerator.onIsPlayingChanged.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });
    SoundGenerator.onOneCycleDataHandler.listen((value) {
      setState(() {
        oneCycleData = value;
      });
    });

    SoundGenerator.setAutoUpdateOneCycleSample(true);
    //Force update for one time
    SoundGenerator.refreshOneCycleData();
  }
}
