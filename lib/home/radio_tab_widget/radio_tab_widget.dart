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
  List<Radios> radios = [];
  int currentPlayingIndex = -1;
  bool isPlaying = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRadios();
  }

  void loadRadios() async {
    final result = await ApiService.getRadios();
    if (result != null) {
      setState(() {
        radios = result.radios ?? [];
        isLoading = false;
      });
    }
  }

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
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                  controller: controller,
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: radios.length,
                  itemBuilder: (context, index) {
                    return RadioItem(
                      player: player,
                      radio: radios[index],
                      isPlaying: index == currentPlayingIndex && isPlaying,
                      onPlayPause: () {
                        togglePlayPause(index);
                      },
                      next: () {
                        _playNextRadio();
                      },
                      previous: () {
                        _playPreviousRadio();
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  void togglePlayPause(int index) async {
    if (isPlaying && currentPlayingIndex == index) {
      await player.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      if (currentPlayingIndex != index) {
        await player.setSourceUrl(radios[index].url!);
      }
      await player.resume();
      setState(() {
        isPlaying = true;
        currentPlayingIndex = index;
      });
    }
  }

  void _playNextRadio() {
    int nextIndex = (currentPlayingIndex + 1) % radios.length;
    togglePlayPause(nextIndex);
    controller.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _playPreviousRadio() {
    int prevIndex = (currentPlayingIndex - 1 + radios.length) % radios.length;
    togglePlayPause(prevIndex);
    controller.animateToPage(
      prevIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
