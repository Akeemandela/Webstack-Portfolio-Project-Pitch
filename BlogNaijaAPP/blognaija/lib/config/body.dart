import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.snippet, required this.date, required this.title, required this.body}) : super(key: key);

  final String snippet;
  final String date;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * .05,),
        Text(title,
          textAlign: TextAlign.left,
          maxLines: 2,
          textScaleFactor: 1.0,

          style: GoogleFonts.montserrat(
            color: colorGg,
            fontWeight: FontWeight.w900,
            fontSize: 16,),),
        Text("Publish : $date",
          textScaleFactor: 1.0,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: colorGg,
            fontWeight: FontWeight.w500,
            fontSize: 10,),),
        Expanded(flex: 1,
          child: Text(body,
            textScaleFactor: 1.0,
            softWrap: false,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
              color: colorGg,
              fontWeight: FontWeight.w500,
              fontSize: 10,),),
        ),
      ],);
  }
}
