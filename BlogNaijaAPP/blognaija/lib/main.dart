import 'package:blognaija/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetMaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

String? token;
String? tokLog;
String? email;


class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      //initialRoute: '/',
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    )/*,
    )*/;
  }
}