import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  // playSound(int num) {
  //   final assetsAudioPlayer = AssetsAudioPlayer();
  //   assetsAudioPlayer.open(
  //     Audio("assets/note$num.wav"),
  //   );
  // }

  playSound(int num) => AssetsAudioPlayer().open(Audio("assets/note$num.wav"));

  // Widget buildKey(int num, Color color) {
  //   return Expanded(
  //     child: TextButton(
  //       style: ButtonStyle(
  //         shape: WidgetStateProperty.all(const RoundedRectangleBorder()),
  //         foregroundColor:
  //         WidgetStateProperty.all<Color>(color),
  //         backgroundColor:
  //         WidgetStateProperty.all<Color>(color),
  //       ),
  //       onPressed: () {
  //         playSound(num);
  //       },
  //       child: const Text(''),
  //     ),
  //   );
  // }

  Widget buildKey(int num, Color color) => Expanded(
        child: TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(const RoundedRectangleBorder()),
            foregroundColor:
            WidgetStateProperty.all<Color>(color),
            backgroundColor:
            WidgetStateProperty.all<Color>(color),
          ),
          onPressed: () {
            playSound(num);
          },
          child: const Text(''),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(1, Colors.indigo),
                buildKey(2, Colors.blue),
                buildKey(3, Colors.indigo),
                buildKey(4, Colors.blue),
                buildKey(5, Colors.indigo),
                buildKey(6, Colors.blue),
                buildKey(7, Colors.indigo)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
