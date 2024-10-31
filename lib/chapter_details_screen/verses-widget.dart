import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/core/my_theme_data.dart';
import 'package:quran_app/home/core/settings_provider.dart';

import '../home/quran_tab_widget/ChapterTitleWidget.dart';

class VersesWidget extends StatelessWidget {
  List<String> verse = [];
  VersesWidget({required this.verse});

  @override
  Widget build(BuildContext context) {
    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 80),
      padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: provider.isDark()
            ? Color(0xff151B31).withOpacity(0.8)
            : Color(0xffF8F8F8).withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' سورة ${args.nameChapter}'),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.play_circle_fill_rounded,
                size: 18,
                color:
                    provider.isDark() ? MyThemeData.yellowColor : Colors.black,
              ),
            ],
          ),
          Divider(
            color: Color(0xffB7935F),
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Text(
                      "{${index + 1}}${verse[index]}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.8),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                itemCount: verse.length),
          ),
        ],
      ),
    );
  }
}
