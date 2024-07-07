import 'package:flutter/material.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_details/hadeth_details_screen.dart';
import 'package:quran_app/home/home_screen.dart';

import 'chapter_details_screen/chapterDetails.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        ChapterDetailsScrean.routeName: (context) => ChapterDetailsScrean(),
        HomeScreen.routeName: (_) => HomeScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
