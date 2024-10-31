import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/core/settings_provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  List<String> listMode = [
    "Light",
    "Dark",
  ];
  List<String> listLanguage = [
    "English",
    "عربي",
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Mode',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            hintText: 'Select Mode',
            items: listMode,
            initialItem: provider.currentThemeMode == ThemeMode.light
                ? listMode[0]
                : listMode[1],
            onChanged: (value) {
              if (value == "Dark") {
                provider.changeThemeMode(ThemeMode.dark);
              }
              if (value == "Light") {
                provider.changeThemeMode(ThemeMode.light);
              }
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedFillColor: provider.isDark()
                  ? Theme.of(context).primaryColorDark
                  : Colors.white,
              expandedFillColor: provider.isDark()
                  ? Theme.of(context).primaryColorDark
                  : Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Language',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            hintText: 'Select Language',
            items: listLanguage,
            initialItem: provider.currentLanguage == "en"
                ? listLanguage[0]
                : listLanguage[1],
            onChanged: (value) {
              if (value == "English") {
                provider.changeLanguageCode("en");
              }
              if (value == "عربي") {
                provider.changeLanguageCode("ar");
              }
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedFillColor: provider.isDark()
                  ? Theme.of(context).primaryColorDark
                  : Colors.white,
              expandedFillColor: provider.isDark()
                  ? Theme.of(context).primaryColorDark
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
