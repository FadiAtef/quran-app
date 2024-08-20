import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  List<String> azkar = [
    "استغفر الله ",
    "الحمد لله ",
    "لا اله الا الله ",
    "الله اكبر",
    "سبحان الله",
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/images/head_of_seb7a.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Transform.rotate(
                    angle: angle,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Image.asset(
                        'assets/images/body_of_seb7a.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' عدد التسبيحات ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 65,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xffC9B396),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "$counter",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: 125,
              decoration: BoxDecoration(
                color: Color(0xffB7935F),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  azkar[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter = 0;
    }
    if (index == azkar.length) {
      index = 0;
    }
    angle += 360 / 30;
    setState(() {});
  }
}
