import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AnimationWidget extends StatefulWidget {
  final Widget child;
  final int delay;
  final double x;
  final double y;
  const AnimationWidget({required this.delay, required this.child, required this.x, required this.y});

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin: Offset(widget.x, widget.y),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}


void souSnackBar(BuildContext context, String message, Color color, {required int seconde}) {
  final snackBar = SnackBar(
    content: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/newspaper.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: color, width: 2.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          Expanded(
              child: Text(message,
                textScaleFactor: 1.0,
                maxLines: 2,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                softWrap: true,
                style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    fontWeight: FontWeight.w200
                ),
              ))
        ],
      ),
    ),
    width: MediaQuery.of(context).size.width / 1.05,
    backgroundColor: colorJ,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: seconde),
    //action: SnackBarAction(label: "X", onPressed: (){}),

  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar,);
}