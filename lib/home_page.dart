// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reuse_container.dart';
import 'package:provider/provider.dart';
import 'test.dart';
import 'buttom_active_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late InterstitialAd interstitialAd;

  void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            this.interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('당신의 전생은?').tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate_rounded),
            tooltip: 'Change language',
            onPressed: () {
              if (context.locale == Locale('en')) {
                EasyLocalization.of(context)!.setLocale(Locale('ko'));
              } else {
                EasyLocalization.of(context)!.setLocale(Locale('en'));
              }
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              onChanged: (changeValue) {
                Provider.of<Test>(context, listen: false).textValue =
                    changeValue;
              },
              decoration: InputDecoration(
                hintText: '이름을 입력해주세요.'.tr(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: activeColor, width: 3.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              ReuseContainer(
                children: [
                  Icon(
                    Icons.male,
                    size: 60,
                  ),
                  Text(
                    '남자'.tr(),
                    style: labelTextStyle,
                  )
                ],
                color: Provider.of<Test>(context, listen: false).maleColor,
                onTap: () {
                  setState(() {
                    if (Provider.of<Test>(context, listen: false).maleColor ==
                        inactiveColor) {
                      Provider.of<Test>(context, listen: false).maleColor =
                          activeColor;
                      Provider.of<Test>(context, listen: false).femaleColor =
                          inactiveColor;
                    } else {
                      Provider.of<Test>(context, listen: false).maleColor =
                          inactiveColor;
                    }
                  });
                },
              ),
              ReuseContainer(
                children: [
                  Icon(
                    Icons.female,
                    size: 60,
                  ),
                  Text(
                    '여자'.tr(),
                    style: labelTextStyle,
                  )
                ],
                color: Provider.of<Test>(context, listen: false).femaleColor,
                onTap: () {
                  setState(() {
                    if (Provider.of<Test>(context, listen: false).femaleColor ==
                        inactiveColor) {
                      Provider.of<Test>(context, listen: false).femaleColor =
                          activeColor;
                      Provider.of<Test>(context, listen: false).maleColor =
                          inactiveColor;
                    } else {
                      Provider.of<Test>(context, listen: false).femaleColor =
                          inactiveColor;
                    }
                  });
                },
              ),
            ],
          ),
          ReuseContainer(children: [
            Text(
              '키'.tr(),
              style: labelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  Provider.of<Test>(context, listen: false)
                      .height
                      .toStringAsFixed(0),
                  style: numberTextStyle,
                ),
                Text(
                  'cm',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Slider(
                activeColor: activeColor,
                inactiveColor: activeColor,
                thumbColor: Colors.white,
                min: 130,
                max: 220,
                value: Provider.of<Test>(context, listen: false).height,
                onChanged: (changeValue) {
                  setState(() {
                    Provider.of<Test>(context, listen: false).height =
                        changeValue;
                  });
                })
          ]),
          Row(
            children: [
              ReuseContainer(
                children: [
                  Text(
                    '몸무게'.tr(),
                    style: labelTextStyle,
                  ),
                  Text(
                    Provider.of<Test>(context, listen: false).weight.toString(),
                    style: numberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          FloatingActionButton(
                            heroTag: 1,
                            onPressed: () {
                              setState(() {
                                Provider.of<Test>(context, listen: false)
                                    .weight--;
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: 2,
                            onPressed: () {
                              setState(() {
                                Provider.of<Test>(context, listen: false)
                                    .weight++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              ReuseContainer(
                children: [
                  Text(
                    '나이'.tr(),
                    style: labelTextStyle,
                  ),
                  Text(
                    Provider.of<Test>(context, listen: false).age.toString(),
                    style: numberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          FloatingActionButton(
                            heroTag: 3,
                            onPressed: () {
                              setState(() {
                                Provider.of<Test>(context, listen: false).age--;
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: 4,
                            onPressed: () {
                              setState(() {
                                Provider.of<Test>(context, listen: false).age++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          ButtomActiveBar(
            onTap: () {
              Navigator.pushNamed(context, '/second');
              Provider.of<Test>(context, listen: false).bmiCalculate();
              interstitialAd.show();
            },
            text: '확인하기'.tr(),
          )
        ],
      ),
    );
  }
}
