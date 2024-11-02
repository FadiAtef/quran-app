import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/core/settings_provider.dart';
import 'package:quran_app/home/radio_tab_widget/radio_model.dart';

import '../core/my_theme_data.dart';

class RadioItem extends StatelessWidget {
  final Radios radio;
  final AudioPlayer player;
  final VoidCallback next;
  final VoidCallback previous;
  final bool isPlaying;
  final VoidCallback onPlayPause;

  RadioItem({
    Key? key,
    required this.radio,
    required this.player,
    required this.next,
    required this.previous,
    required this.isPlaying,
    required this.onPlayPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    final Color iconColor = provider.isDark()
        ? MyThemeData.yellowColor
        : MyThemeData.lightPrimaryColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          // Controls for previous, play/pause, and next actions
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: previous,
                icon: Icon(Icons.skip_previous, size: 30, color: iconColor),
              ),
              const SizedBox(width: 15),
              IconButton(
                onPressed: onPlayPause,
                icon: Icon(
                  isPlaying ? Icons.pause_circle : Icons.play_circle,
                  size: 30,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 15),
              IconButton(
                onPressed: next,
                icon: Icon(Icons.skip_next, size: 30, color: iconColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Display the radio name in the center
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
