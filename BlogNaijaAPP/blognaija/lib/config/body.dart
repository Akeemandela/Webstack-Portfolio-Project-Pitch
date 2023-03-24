import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * .05,),
        Text("Didier drogba en ci",
          textAlign: TextAlign.center,
          textScaleFactor: 1.0,
          style: GoogleFonts.montserrat(
            color: colorGg,
            fontWeight: FontWeight.w900,
            fontSize: 18,),),
        Text("Publish : 10-03-23",
          textScaleFactor: 1.0,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: colorGg,
            fontWeight: FontWeight.w500,
            fontSize: 10,),),
        Expanded(flex: 1,
          child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as".substring(0, 40) + '...',
            textScaleFactor: 1.0,
            softWrap: false,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: colorGg,
              fontWeight: FontWeight.w500,
              fontSize: 10,),),
        ),
      ],);
  }
}
