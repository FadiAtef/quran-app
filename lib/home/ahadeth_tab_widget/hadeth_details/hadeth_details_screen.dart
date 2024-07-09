import 'package:flutter/material.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'Hadeth-Details';
  @override
  Widget build(BuildContext context) {
    HadethItem args = ModalRoute.of(context)?.settings.arguments as HadethItem;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/main_background.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'اسلامي',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: Card(
            margin: EdgeInsets.all(12),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      args.title,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xffB7935F),
                  ),
                  Text(
                    args.content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
