import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/head_of_seb7a.png'),
        Image.asset('assets/images/body_of_seb7a.png'),
      ],
    );
  }
}
