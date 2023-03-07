import 'package:flutter/material.dart';

Widget builderSizedbox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget buildText(text, color, size, weight) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    ),
  );
}
