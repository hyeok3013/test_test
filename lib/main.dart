import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:test_test/result_page.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'result_page.dart';
import 'test.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  // 아래 두줄 추가
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(
      // 통째로 추가
      EasyLocalization(
    saveLocale: true,
    useOnlyLangCode: true,
    // 언어는 본인이 필요한 거에 맞게 작성(추후에 만들 json파일과 관련이 있음)
    supportedLocales: [Locale('en'), Locale('ko')],
    path: 'assets/translations',
    fallbackLocale: Locale('ko'),
    startLocale: Locale('ko'),

    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => Test(),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData.dark().copyWith(
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: activeColor)),
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/second': (context) => ResultPage()
          },
        ));
  }
}
