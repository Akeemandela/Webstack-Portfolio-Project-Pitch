
import 'dart:convert';

import 'package:blognaija/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/body.dart';
import '../config/color.dart';
import '../config/path.dart';


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
      Get.to(() => const HomePage(), transition: Transition.circularReveal,
          duration: const Duration(seconds: 2));
    },
      backgroundColor: colorGg,
      label:  Text('Add',
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
             Padding(padding:const EdgeInsets.only(left: 10, right: 10),
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               //mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(height: height / 28),
                 Container(
                   height: height * .83,
                   width: width * 0.85,
                   decoration: const BoxDecoration(
                     //border: Border.all(color: Colors.black, width: 2),
                     color: Colors.white,
                     borderRadius:  BorderRadius.all(Radius.circular(5)),),
                   child: FutureBuilder<List<Posts>>(
                           future: fetchCodeRedTot(),
                          builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            //physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 20,),
                            separatorBuilder: (context, index) => const SizedBox(height: 3,),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                               Container(
                                 height: 50,
                                 child:  Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Image.asset(
                                       'assets/newspaper.png',
                                       alignment: Alignment.center,
                                       filterQuality: FilterQuality.high,
                                       height: 20,
                                       fit: BoxFit.cover,
                                     ),
                                     Body(),
                                     Icon(Icons.remove_red_eye ,color: colorGg,),
                                   ],
                                 ),
                               ),
                                /*Divider(
                                  height: MediaQuery.of(context).size.height * .03,
                                  indent: MediaQuery.of(context).size.width * 0.02,
                                  endIndent: MediaQuery.of(context).size.width * 0.02,
                                  color: colorGg,
                                ),*/
                                // SizedBox(height: MediaQuery.of(context).size.height * .01,),

                              ],
                            )
                        );
                      } else {
                        return Center(child: Image.asset(
                          'assets/load.gif',
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.high,
                          height: 230,
                          fit: BoxFit.cover,
                        ),);
                      }
                    },
                  )),
                 SizedBox(height:height * 0.06),

               ],
             ),
             )

            ],),
        )
    );
  }

  Future<List<Posts>> fetchCodeRedTot() async {
    final response =
    await http.get(Uri.parse('$apiRoute/posts'),
      headers:
      <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {

      final parsed = json.decode(response.body)['data'].cast<Map<String, dynamic>>();

      return parsed.map<Posts>((json) => Posts.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}