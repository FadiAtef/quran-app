import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget {
  String verse;

  VersesWidget({required this.verse});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      child: Text(
        verse,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,

      ),
    );
  }
}
