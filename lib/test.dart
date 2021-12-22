import 'dart:math';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Test extends ChangeNotifier {
  double height = 170;
  int weight = 60;
  int age = 20;
  String textValue = '';
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;
  late double bmi;

  String bmiCalculate() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String ChooseRace() {
    if (bmi >= 25) {
      return '오우거';
    } else if (23 <= bmi) {
      return '오크';
    } else if (18.5 <= bmi) {
      return '인간';
    } else {
      return '엘프';
    }
  }

  String ChooseRaceText() {
    if (bmi >= 25) {
      return '당신은 인간에게 살해당해 삶을 마감했습니다.';
    } else if (23 <= bmi) {
      return '당신은 오크족장으로서 삶을 마감했습니다.';
    } else if (18.5 <= bmi) {
      return '당신은 평범한 인간으로서 삶을 마감했습니다.';
    } else {
      return '당신은 숲의 영웅으로서 삶을 마감했습니다.';
    }
  }
}
