import 'package:flutter/material.dart';

class LableText extends StatelessWidget {
  final String text;
  final double size;

  const LableText({Key key, @required this.text, this.size = 14})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 1.5,
        color: Colors.grey.shade900,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
