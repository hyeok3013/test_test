import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'buttom_active_bar.dart';
import 'test.dart';
import 'reuse_container.dart';
import 'constants.dart';
import 'package:easy_localization/easy_localization.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '당신의 결과'.tr(),
                style: largeTextStyle,
              ),
            ),
            ReuseContainer(
              children: [
                Text(
                  '${Provider.of<Test>(context, listen: false).textValue}' +
                      '님의 전생은?'.tr(),
                  style: labelTextStyle,
                ),
                Text(
                  Provider.of<Test>(context, listen: false).ChooseRace().tr(),
                  style: numberTextStyle,
                ),
                Text(
                  Provider.of<Test>(context, listen: false)
                      .ChooseRaceText()
                      .tr(),
                  style: labelTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ButtomActiveBar(
              onTap: () {
                Navigator.pop(context);
              },
              text: "다시하기".tr(),
            )
          ],
        ),
      ),
    );
  }
}
