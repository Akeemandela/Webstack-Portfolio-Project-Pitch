import 'dart:async';

import 'package:blognaija/config/anim.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    myToken(context);
    // TODO: implement initState
    super.initState();
  }

  Future<void> myToken(context) async {
    //token = await UserSecureStorage.getTokenAuth();
    //final auth = Provider.of<AuthProvider>(context, listen: false);
    Timer(
        const Duration(
          milliseconds: 500,
          seconds: 5,
        ), () async {
      Get.to(() => HomePage(), transition: Transition.circularReveal,
          duration: const Duration(seconds: 4));
      //Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/new.gif',
                alignment: Alignment.center,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            AnimationWidget(
                delay: 1500,
                x: 0.0,
                y: 1.0,
                child: Padding(padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child:Text("NAIJA NEWS BLOG",
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      style: GoogleFonts.raleway(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w800
                      ),)
            ),),
            const SizedBox(height: 20,)
          ],
        )
    );
  }
}