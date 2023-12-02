import 'package:flutter/material.dart';

Widget gradiantCircle(double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.17, -0.98),
        end: Alignment(0.17, 0.98),
        colors: [Color(0xFFE8C082), Color(0xFF914576)],
      ),
      shape: OvalBorder(),
    ),
  );
}


