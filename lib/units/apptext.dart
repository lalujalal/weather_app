
import 'package:flutter/material.dart';

class Apptext extends StatelessWidget {
  final String? data;
  final double? size;
  final Color? color;
  final FontWeight? fw;
  final TextAlign? align;
  const Apptext({super.key,
    required this.data,
    this.size,
    this.color,
    this.fw,
    this.align
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data.toString(),
      textAlign: align,
      style: TextStyle(fontSize: size,color: color,fontWeight: fw,fontFamily: "Roboto"),
    );
  }
}