import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/ahadeth_tab_widget/hadeth_details/hadeth_details_screen.dart';
import 'package:quran_app/home/home_screen.dart';
import 'package:quran_app/home/splash_screen/splash_view.dart';

import 'chapter_details_screen/chapterDetails.dart';
import 'home/core/settings_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(), child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.currentLanguage),
      // theme: ThemeData.light(),
      theme: ThemeData.light(),

      themeMode: provider.currentThemeMode,
      darkTheme: ThemeData.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        ChapterDetailsScrean.routeName: (context) => ChapterDetailsScrean(),
        HomeScreen.routeName: (_) => HomeScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        SplashView.routeName: (context) => SplashView(),
      },
      initialRoute: SplashView.routeName,
    );
  }
}
