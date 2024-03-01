import 'package:flutter/material.dart';

Widget customText(
  String text,
  double size, {
  Color? color,
  FontWeight? weight,
  FontStyle? style,
  TextDecoration? cusdecoration,
}) {
  return Text(
    text,
    style: TextStyle(
      // overflow: TextOverflow.ellipsis,
      color: color ?? Colors.black,
      fontSize: size,
      fontWeight: weight ?? FontWeight.normal,
      fontStyle: style ?? FontStyle.normal,
      decoration: cusdecoration as TextDecoration? ?? TextDecoration.none,
    ),
  );
}
