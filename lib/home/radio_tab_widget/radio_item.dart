import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:provider/provider.dart';
import 'package:quran_app/home/core/settings_provider.dart';
import 'package:quran_app/home/radio_tab_widget/radio_model.dart';

import '../core/my_theme_data.dart';

class RadioItem extends StatelessWidget {
  final Radios radio;
  final AudioPlayer player;
  final Function next, previous;
  final bool isPlaying; // New parameter to track if the radio is playing

  RadioItem({
    super.key,
    required this.radio,
    required this.player,
    required this.next,
    required this.previous,
    required this.isPlaying, // Add this parameter to the constructor
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => previous(),
                icon: Icon(
                  Icons.skip_previous,
                  size: 30,
                  color: provider.isDark()
                      ? MyThemeData.yellowColor
                      : MyThemeData.lightPrimaryColor,
                ),
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: () {
                  if (isPlaying) {
                    player.pause();
                  } else if (radio.url != null) {
                    player.play(UrlSource(radio.url!));
                  }
                },
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle
                      : Icons.play_circle, // Toggle icon
                  size: 30,
                  color: provider.isDark()
                      ? MyThemeData.yellowColor
                      : MyThemeData.lightPrimaryColor,
                ),
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: () {
                  player.pause();
                },
                icon: Icon(
                  Icons.pause_circle,
                  size: 30,
                  color: provider.isDark()
                      ? MyThemeData.yellowColor
                      : MyThemeData.lightPrimaryColor,
                ),
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: () => next(),
                icon: Icon(
                  Icons.skip_next,
                  size: 30,
                  color: provider.isDark()
                      ? MyThemeData.yellowColor
                      : MyThemeData.lightPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              radio.name ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
