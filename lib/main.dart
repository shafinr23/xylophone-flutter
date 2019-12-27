import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
    HapticFeedback.vibrate();
  }

  Expanded buildKey({int snumber, Color col}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          return playSound(snumber);
        },
        color: col,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool enableFeedback = false;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildKey(snumber: 1, col: Colors.red),
              buildKey(snumber: 2, col: Colors.purpleAccent),
              buildKey(snumber: 3, col: Colors.pinkAccent),
              buildKey(snumber: 4, col: Colors.blue),
              buildKey(snumber: 5, col: Colors.amberAccent),
              buildKey(snumber: 6, col: Colors.redAccent),
              buildKey(snumber: 7, col: Colors.deepOrangeAccent),
            ],
          ),
        ),
      ),
    );
  }
}
