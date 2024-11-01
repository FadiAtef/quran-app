import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/core/settings_provider.dart';
import 'package:quran_app/home/radio_tab_widget/radio_item.dart';
import 'package:quran_app/home/radio_tab_widget/radio_model.dart';

import '../../api/api_service.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  PageController controller = PageController();
  final AudioPlayer player = AudioPlayer();
  int currentPlayingIndex =
      -1; // Tracks the index of the currently playing radio

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png',
          ),
        ),
        const SizedBox(height: 50),
        Text(
          "اذاعة القران الكريم",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        Expanded(
          child: FutureBuilder(
            future: ApiService.getRadios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Failed to load Radios"));
              } else if (snapshot.hasData) {
                List<Radios>? radios = snapshot.data?.radios;

                return PageView.builder(
                  controller: controller,
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: radios?.length ?? 0,
                  itemBuilder: (context, index) {
                    return RadioItem(
                      player: player,
                      radio: radios![index],
                      isPlaying: index ==
                          currentPlayingIndex, // Check if this item is currently playing
                      next: () {
                        setState(() {
                          player.pause();
                          currentPlayingIndex = (index + 1) % radios.length;
                        });
                        controller.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.bounceIn,
                        );
                        player
                            .play(UrlSource(radios[currentPlayingIndex].url!));
                      },
                      previous: () {
                        setState(() {
                          player.pause();
                          currentPlayingIndex =
                              (index - 1 + radios.length) % radios.length;
                        });
                        controller.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.bounceIn,
                        );
                        player
                            .play(UrlSource(radios[currentPlayingIndex].url!));
                      },
                    );
                  },
                );
              } else {
                return const Center(child: Text("No data available"));
              }
            },
          ),
        ),
      ],
    );
  }
}
