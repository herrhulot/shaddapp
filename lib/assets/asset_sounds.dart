import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AssetSounds {
  static final _player = AudioCache(prefix: "sounds/");

  static final _files = <String>[
    "shaddapp_01.mp3",
    "shaddapp_02.mp3",
    "shaddapp_03.mp3",
    "shaddapp_04.mp3",
    "shaddapp_05.mp3",
    "shaddapp_06.mp3",
  ];

  static Future<AudioPlayer> playShaddapp() {
    final fileIndex = Random().nextInt(_files.length);
    return _player.play(_files[fileIndex]);
  }
}
