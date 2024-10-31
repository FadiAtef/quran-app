import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/chapter_details_screen/verses-widget.dart';
import 'package:quran_app/home/core/settings_provider.dart';
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
    var provider = Provider.of<SettingsProvider>(context);
    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if (verses.isEmpty) {
      readFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(provider.getHomeBackground()),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'اسلامي',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : VersesWidget(verse: suraLines)),
    );
  }

  List<String> suraLines = [];
  Future<void> readFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    suraLines = fileContent.split('\n');
    verses = suraLines;
    verses.join('\n');
    setState(() {});
  }
}
