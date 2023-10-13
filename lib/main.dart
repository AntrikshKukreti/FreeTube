import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freetube/Theme/darkTheme.dart';
import 'package:get/get.dart';
import 'Constants/constant.dart';
import 'Theme/lightTheme.dart';
import 'landingPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

final constant = Constants();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FreeTube',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'FreeTube'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), ()
    {
      Get.off(() => const LandingPage(title: 'LandingPage'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Center(
              child: Image(
                image: const AssetImage('assets/images/youTubeIcon.png'),
                height: Get.height * 0.1,
              ),
            )));
  }
}
