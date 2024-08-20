import 'package:flutter/material.dart';
import 'package:quran_app/home/ahadeth_tab_widget/ahadeth_tab_widget.dart';
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/main_background.png'),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('أسلامى'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedicon,
          onTap: (index) {
            selectedicon = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/images/quran_ic.png',
                ),
              ),
              label: 'Quran',
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/ahadeth_ic.png')),
              label: 'Ahadeth',
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/tasbeh_ic.png')),
              label: 'Sebha',
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/radio_ic.png')),
              label: 'Radio',
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
        body: tabs[selectedicon],
      ),
    );
  }
}
