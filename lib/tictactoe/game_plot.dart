import 'package:flutter/material.dart';

class GamePlot {
  final id;
  String text;
  Color bg;
  bool played;

  GamePlot({
    this.id,
    this.text = "",
    this.bg = Colors.cyan,
    this.played = false,
  });
}
