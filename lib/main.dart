import 'package:china/layout/bottom/bottom.dart';
import 'package:china/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=a55b4497aa5a4dd9959cd9d983a5c9b1&fbclid=IwAR2EigBaIVCk8_6Ci4lLi5zzCknW0epESDCmbDpi_fwrod71EB6CIOpPtF8
//url:https://newsapi.org/
//method:v2/top-headlines?
//query:country=eg&category=business&apiKey=a55b4497aa5a4dd9959cd9d983a5c9b1&fbclid=IwAR2EigBaIVCk8_6Ci4lLi5zzCknW0epESDCmbDpi_fwrod71EB6CIOpPtF8
void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
          appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ))),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black54,
      ),
      home: bottom(),
    );
  }
}
