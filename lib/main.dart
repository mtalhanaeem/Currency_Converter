import 'package:currency_converter/pages/currency_converter_cupertino_page.dart';
import 'package:currency_converter/pages/currency_converter_material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  ///Change to MyMaterialApp() or MyCupertinoApp() to see design changes.
  runApp(const MyMaterialApp());
}

///1. Material Design
class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //remove debug banner
      home: CurrencyConverterMaterialPage(),
    );
  }
}

///2. Cupertino Design
class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: true, //show debug banner
      home: CurrencyConverterCupertinoPage(),
    );
  }
}
