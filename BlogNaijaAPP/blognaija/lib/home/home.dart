import 'dart:convert';
import 'package:blognaija/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/anim.dart';
import '../config/body.dart';
import '../config/color.dart';
import '../config/path.dart';
import 'contains.dart';


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
        automaticallyImplyLeading: false,
        title: Text("NAIJA NEWS BLOG",
        style: GoogleFonts.raleway(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w800,
    ),
      ),
    elevation: 0.7,
    ),
   /* floatingActionButton: FloatingActionButton.extended(onPressed: () {
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
    ),*/
        body: RefreshIndicator(
          onRefresh: () async {
            // code à exécuter lors de l'actualisation
            await Future.delayed(Duration(seconds: 1)); // par exemple, attendre 1 seconde
            setState(() {}); // mettre à jour l'interface graphique
          },
          child: FutureBuilder<List<Posts>>(
            future: fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: false,
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {

                      return   Padding(padding: EdgeInsets.only(left: 7, right: 10),
                        child: InkWell(
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                                border: Border(left: BorderSide(
                                  color: Colors.red,
                                  width: 5.0,
                                ),)
                            ),
                            child: Body(snippet: "${snapshot.data![index].snippet}", date: "${snapshot.data![index].datePub}", title: "${snapshot.data![index].title}", body: "${snapshot.data![index].body}"),
                          ),
                          onTap: () {
                            Get.to(() => BlogPostPage(title:"${snapshot.data![index].title}", date: "${snapshot.data![index].datePub}", content: "${snapshot.data![index].body}", category: "${snapshot.data![index].snippet}",), transition: Transition.zoom,
                                duration: const Duration(seconds: 1));
                          },
                        ),
                      );
                    }
                );
              } else if (snapshot.hasError) {
                // code pour afficher une erreur
                souSnackBar(context, ' Please restart after', Colors.red, seconde: 4);
                return Center(child: Image.asset(
                  'assets/load.gif',
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.high,
                  height: 230,
                  fit: BoxFit.cover,
                ),);
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
          ))
    );
  }

  Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse('$apiRoute/posts'),
      headers:
      <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    print(json.decode(response.body)['data']);
    if (response.statusCode == 200) {

      final parsed = json.decode(response.body)['data'].cast<Map<String, dynamic>>();

      return parsed.reversed.map<Posts>((json) => Posts.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}