import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
//UI not change so No need to stateful class
class TheBodyV2 extends StatelessWidget {
  final AudioCache player = AudioCache();
  final List<String> playList = [
    "note1.wav",
    "note2.wav",
    "note3.wav",
    "note4.wav",
    "note4.wav",
    "note5.wav",
    "note6.wav"
  ];

  @override
  Widget build(BuildContext context) {
    player.loadAll(playList);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          notePadWithInkWell(Colors.red, "C", 1),
          notePadWithInkWell(Colors.yellow, "D", 2),
          notePadWithInkWell(Colors.blue, "E", 3),
          notePadWithInkWell(Colors.cyan, "F", 4),
          notePadWithInkWell(Colors.orange, "G", 5),
          notePadWithInkWell(Colors.deepPurple, "A", 6),
          notePadWithInkWell(
            Colors.pink,
            "B",
            7,
          ),

//          notePad(Colors.red, "C", 1, player),
//          notePad(Colors.green, "D", 2, player),
//          notePad(Colors.blue, "E", 3, player),
//          notePad(Colors.cyan, "F", 4, player),
//          notePad(Colors.orange, "G", 5, player),
//          notePad(Colors.deepPurple, "A", 6, player),
//          notePad(Colors.pink, "B", 7, player),
        ],
      ),
    );
  }
}

Widget notePadWithFaltButton(Color color, String noteName, int noteIndex, AudioCache player) {
  return Expanded(
    child: FlatButton(
      splashColor: Colors.white,
      textColor: Colors.white,
      color: color,
      child: Text(
        "$noteName",
        style: TextStyle(fontSize: 30),
      ),
      onPressed: () {
        player.play("note$noteIndex.wav");
      },
    ),
  );
}

Widget notePadWithInkWell(Color color, String noteName, int noteIndex) {
  return Expanded(
    child: Container(
        color: Colors.red,
        child: Material(
          color: color,
          child: InkWell(
            child: Center(
                child: Text(
              noteName,
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
            enableFeedback: false,
            onTap: () {
              final AudioCache audio = AudioCache();
              audio.play("note$noteIndex.wav");
            },
          ),
        )),
  );
}

void loadTracks() {}
