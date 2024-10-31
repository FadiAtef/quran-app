import 'package:flutter/material.dart';

import '../../chapter_details_screen/chapterDetails.dart';

class ChapterTitleWidget extends StatelessWidget {
  String nameChapter;
  int index;

  ChapterTitleWidget({
    required this.nameChapter,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChapterDetailsScrean.routeName,
            arguments:
                ChapterDetailsArgs(index: index, nameChapter: nameChapter));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          child: Text(
            nameChapter,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
    );
  }
}

class ChapterDetailsArgs {
  String nameChapter;
  int index;

  ChapterDetailsArgs({required this.index, required this.nameChapter});
}
