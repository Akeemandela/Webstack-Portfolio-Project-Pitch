import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../config/color.dart';

class BlogPostPage extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final String category;

  BlogPostPage({super.key, required this.title, required this.date, required this.content, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGg,
        elevation: 0.6,
        centerTitle: true,

        title: Text(title.toUpperCase(),
        style:  GoogleFonts.raleway(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 4, bottom: 0),
              child: Text(
                category[0].toUpperCase() + category.substring(1),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 2, bottom: 0),
              child: Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.2)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: colorJ),
                    ),
                  ),
                ),
                onPressed: () {
                  Share.share('title: $title \n content: $content');
                },
                child: Container(
                  child: Text("Share post"),
                ),
              )
            ),


          ],
        ),
      ),
    );
  }
}
