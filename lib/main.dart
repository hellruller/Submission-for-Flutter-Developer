import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Controllers/Postcontroller.dart';
import 'HomPage/HomePage.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
  Get.put(postcontroller());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:splashscreeen  (title: 'STAR'),
    );
  }
}


