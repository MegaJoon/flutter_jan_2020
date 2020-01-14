import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0101/solar_system_ui.dart';
import 'package:flutter_jan_2020/0102/guitar_app.dart';
import 'package:flutter_jan_2020/0103/choose_character_app.dart';
import 'package:flutter_jan_2020/0106/lighting_app.dart';
import 'package:flutter_jan_2020/0107/bank_cards_app.dart';
import 'package:flutter_jan_2020/0108/customized_option.dart';
import 'package:flutter_jan_2020/0109/plate_app.dart';
import 'package:flutter_jan_2020/0110/second_lighting_app.dart';
import 'package:flutter_jan_2020/0110/travel_app.dart';
import 'package:flutter_jan_2020/0112/lac_blanc_app.dart';
import 'package:flutter_jan_2020/0112/splash_app.dart';
import 'package:flutter_jan_2020/0113/park_app.dart';
import 'package:flutter_jan_2020/0114/park_app_remind.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: SolarSystemUI(),  // 01-01
//      home: GuitarApp(),  // 01-02
//      home: ChooseCharacterApp(),  // 01-03
//      home: LightingApp(),  // 01-06
//      home: BankCardsApp(),  // 01-07
//      home: CustomizedOption(),  // 01-08
//      home: PlateApp(),  // 01-09
//      home: SecondLightingApp(),  // 01-10
//      home: TravelApp(),  // 01-10
//      home: SplashApp(),  // 01-12
//      home: LacBlancApp(),  // 01-12
//      home: ParkApp(),  // 01-13
      home: ParkAppRemind(),  // 01-14
    );
  }
}
