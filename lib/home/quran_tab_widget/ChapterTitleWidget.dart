import 'package:flutter/material.dart';

import '../../chapter_details_screen/chapterDetails.dart';

class ChapterTitleWidget extends StatelessWidget {
String chapterTitle;
int index;
ChapterTitleWidget( {required this.chapterTitle,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
    Navigator.pushNamed(context, ChapterDetailsScrean.routeName,
    arguments: ChapterDetailsArgs(index: index, nameChapter: chapterTitle)
    );
    
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        child:Text(chapterTitle,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),)
      ),
    );
  }
}

class ChapterDetailsArgs {
  String nameChapter;
  int index;

  ChapterDetailsArgs({required this.index, required this.nameChapter});
}