import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/chapter_details_screen/verses-widget.dart';
import 'package:quran_app/home/quran_tab_widget/ChapterTitleWidget.dart';

class ChapterDetailsScrean extends StatefulWidget {
  static const String routeName = 'Chapter-Details';

  @override
  State<ChapterDetailsScrean> createState() => _ChapterDetailsScreanState();
}

class _ChapterDetailsScreanState extends State<ChapterDetailsScrean> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if(verses.isEmpty) {
      readFile(args.index);
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/main_background.png'),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.nameChapter),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) =>VersesWidget(verse: verses[index]),
                separatorBuilder: (context, index) => Container(
                      color: Theme.of(context).colorScheme.primary,

                    ),
                itemCount: verses.length),
      ),
    );
  }

  void readFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    verses = suraLines;
    setState(() {});
  }
}
