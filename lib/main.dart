import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goindiastock/pages/Home/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.grey.shade700),
      home: Home(),
    );
  }
}
