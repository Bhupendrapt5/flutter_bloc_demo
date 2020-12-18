import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String text;
  final double size;

  const InfoText({
    Key key,
    @required this.text,
    this.size = 16,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 1.5,
        color: Colors.grey.shade600,
        fontSize: size,
      ),
    );
  }
}
