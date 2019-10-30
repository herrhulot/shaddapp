import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shaddapp/assets/asset_sounds.dart';

import 'assets/asset_images.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shaddapp',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: YourHomePage(),
    );
  }
}

class YourHomePage extends StatefulWidget {
  @override
  _YourHomePageState createState() => _YourHomePageState();
}

class _YourHomePageState extends State<YourHomePage> {
  AudioPlayer _audioPlayer;
  String _buttonImage = AssetImages.button;

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text("Shaddapp!"),
                ),
                // Padding(padding: EdgeInsets.only(top:16),),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        Image.asset(_buttonImage),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTapCancel: () async {
                              setState(() {
                                _buttonImage = AssetImages.button;
                              });
                              await _audioPlayer?.stop();
                              await _audioPlayer?.dispose();
                              _audioPlayer = null;
                            },
                            borderRadius: BorderRadius.circular(123123),
                            onTap: _playSound,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// async innebär att den här funktionen/metoden tillåter att den väntar på asynkrona
// anrop. Funktionen/metoden returnerar alltid en Future, dessa kan i sin tur
// bara väntas på från andra async-metoder. Alternativet är att köra .then()

  _playSound() async {
    // "?" innebär att den kallar inte på "stop"-metoden/funktionen om den inte
    // finns (null). Men om den har ett värde och finns så kallar den på metoden.
    await _audioPlayer?.stop();
    await _audioPlayer?.dispose();
    // Await betyder att vi inväntar en Future, ett svar som kommer i framtiden.
    // Kan enbart kallas från en metod som har async, annars måste man köra
    // .then på denna.
    setState(() {
      _buttonImage = AssetImages.buttonOn;
    });
    _audioPlayer = await AssetSounds.playShaddapp();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == AudioPlayerState.COMPLETED) {
        _audioPlayer?.dispose();
        _audioPlayer = null;
        setState(() {
          _buttonImage = AssetImages.button;
        });
      }
    });
  }
}
