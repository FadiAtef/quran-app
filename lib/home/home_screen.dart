import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/ahadeth_tab_widget/ahadeth_tab_widget.dart';
import 'package:quran_app/home/core/my_theme_data.dart';
import 'package:quran_app/home/core/settings_provider.dart';
import 'package:quran_app/home/quran_tab_widget/quran_tab_widget.dart';
import 'package:quran_app/home/radio_tab_widget/radio_tab_widget.dart';
import 'package:quran_app/home/sebha_tab_widget/sebha_tab_widget.dart';
import 'package:quran_app/home/setting_tab_widget/setting_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedicon = 0;

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lange = AppLocalizations.of(context)!;
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
            lange.islami,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: provider.isDark()
              ? Theme.of(context).primaryColor
              : MyThemeData.lightPrimaryColor,
          selectedIconTheme: IconThemeData(
            color: provider.isDark() ? MyThemeData.yellowColor : Colors.black,
          ),
          selectedLabelStyle: TextStyle(
            color: provider.isDark() ? MyThemeData.yellowColor : Colors.black,
          ),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedItemColor: Colors.white,
          selectedItemColor:
              provider.isDark() ? MyThemeData.yellowColor : Colors.black,
          currentIndex: selectedicon,
          onTap: (index) {
            selectedicon = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: provider.isDark()
                  ? Theme.of(context).primaryColor
                  : MyThemeData.lightPrimaryColor,
              icon: ImageIcon(
                const AssetImage(
                  'assets/images/quran_ic.png',
                ),
                color:
                    provider.isDark() ? MyThemeData.yellowColor : Colors.black,
              ),
              label: lange.quran,
            ),
            BottomNavigationBarItem(
              backgroundColor: provider.isDark()
                  ? Theme.of(context).primaryColor
                  : MyThemeData.lightPrimaryColor,
              icon: ImageIcon(
                AssetImage(
                  'assets/images/ahadeth_ic.png',
                ),
                color:
                    provider.isDark() ? MyThemeData.yellowColor : Colors.black,
              ),
              label: lange.hadeth,
            ),
            BottomNavigationBarItem(
              backgroundColor: provider.isDark()
                  ? Theme.of(context).primaryColor
                  : MyThemeData.lightPrimaryColor,
              icon: ImageIcon(
                AssetImage('assets/images/tasbeh_ic.png'),
                color:
                    provider.isDark() ? MyThemeData.yellowColor : Colors.black,
              ),
              label: lange.sebha,
            ),
            BottomNavigationBarItem(
              backgroundColor: provider.isDark()
                  ? Theme.of(context).primaryColor
                  : MyThemeData.lightPrimaryColor,
              icon: ImageIcon(
                AssetImage('assets/images/radio_ic.png'),
                color:
                    provider.isDark() ? MyThemeData.yellowColor : Colors.black,
              ),
              label: lange.radio,
            ),
            BottomNavigationBarItem(
              backgroundColor: provider.isDark()
                  ? Theme.of(context).primaryColor
                  : MyThemeData.lightPrimaryColor,
              icon: Icon(
                Icons.settings,
                color:
                    provider.isDark() ? MyThemeData.yellowColor : Colors.black,
              ),
              label: lange.setting,
            ),
          ],
        ),
        body: tabs[selectedicon],
      ),
    );
  }
}
