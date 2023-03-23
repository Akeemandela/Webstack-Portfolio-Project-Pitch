
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/color.dart';


class HomePage extends StatefulWidget {
  static const id = "home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorB,
      // curved navigation ba
      appBar: AppBar(
        backgroundColor: colorGg,
        centerTitle: true,
        title: Text("NAIJA NEWS BLOG",
        textAlign: TextAlign.left,
        maxLines: 3,
        style: GoogleFonts.raleway(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w800,
    ),
      ),
    elevation: 0.7,
    ),
    floatingActionButton: FloatingActionButton.extended(onPressed: () {
      Get.to(() => HomePage(), transition: Transition.circularReveal,
          duration: const Duration(seconds: 2));
    },
      backgroundColor: colorGg,
      label:  Text('Ajouter',
          textScaleFactor: 1.0,
          textAlign: TextAlign.left,
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,)),
      icon: const Icon(Icons.add, color: Colors.white, size: 26,),
    ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
             Padding(padding: EdgeInsets.only(left: 10, right: 10),
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               //mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(height: height / 28),
                 Container(
                   height: height * .83,
                   width: width * 0.85,
                   decoration: BoxDecoration(
                     //border: Border.all(color: Colors.black, width: 2),
                     color: Colors.white,
                     borderRadius: new BorderRadius.all(Radius.circular(5)),),
                   child: const Text(''),
                 ),
                 SizedBox(height:height * 0.06),

               ],
             ),
             )

            ],),
        )
    );
  }
}