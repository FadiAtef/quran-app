import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/core/my_theme_data.dart';

import '../core/settings_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> tasbeh = [
    'سبحان الله',
    'استغفر الله',
    'الحمد الله',
    'الله اكبر',
    'لا اله الا الله',
    'اعوذ بالله'
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lange = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    provider.isDark()
                        ? 'assets/images/dark_head_of_seb7a.png'
                        : 'assets/images/head_of_seb7a.png',
                    height: 100,
                  )),
            ),
            GestureDetector(
              onTap: counterMethod,
              child: Padding(
                padding: const EdgeInsets.only(top: 72.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(provider.isDark()
                          ? 'assets/images/dark_body_of_seb7a.png'
                          : 'assets/images/body_of_seb7a.png'),
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          lange.numbertasbeh,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: provider.isDark()
                ? Theme.of(context).primaryColor.withOpacity(.6)
                : MyThemeData.lightPrimaryColor.withOpacity(.6),
          ),
          child: Text(
            counter.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: provider.isDark()
                ? MyThemeData.yellowColor.withOpacity(.6)
                : MyThemeData.lightPrimaryColor,
          ),
          child: Text(
            tasbeh[index],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }

  counterMethod() {
    angle += 20;
    if (counter == 33) {
      counter = 0;

      if (index < tasbeh.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      counter++;
    }
    setState(() {});
  }
}
