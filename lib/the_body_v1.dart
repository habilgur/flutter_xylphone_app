import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
//UI not change so No need to stateful class... V2 is shorter and right one. Keep it simple
// If elements are too few, no need any List items or builder. Just write it down..
class TheBodyV1 extends StatefulWidget {
  @override
  _TheBodyV1State createState() => _TheBodyV1State();
}

class _TheBodyV1State extends State<TheBodyV1> {
  List<Color> colorsOfButtons = [
    Colors.cyan,
    Colors.indigo,
    Colors.teal,
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.orange,
  ];
  List<String> nameOfNotes = ["C", "D", "E", "F", "G", "A", "B"];

  static AudioCache player = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  void playLocalSound(int trackNum) async {
    var path = "note$trackNum.wav";
    await player.play(path);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.loadAll([
      "note1.wav",
      "note2.wav",
      "note3.wav",
      "note4.wav",
      "note5.wav",
      "note6.wav",
      "note7.wav"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Play Me"),
          backgroundColor: Colors.black,
        ),
        body: Container(
//          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                //ListView.builder Column içerisnde Expanded olmadan çalışmaz!!!!!!
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          height: (MediaQuery.of(context).size.height) / 8,
                          color: colorsOfButtons[index],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${nameOfNotes[index]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            playLocalSound(index + 1);
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
