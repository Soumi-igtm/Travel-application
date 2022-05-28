import 'package:flutter/material.dart';

class AppSmallText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppSmallText({Key? key,
    this.size=12,
    required this.text,
    this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize:size
      ),
    );
  }
}
