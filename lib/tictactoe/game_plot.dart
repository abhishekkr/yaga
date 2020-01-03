import 'package:flutter/material.dart';
import 'package:yaga/tictactoe/constants.dart';

class GamePlot {
  final id;
  String text;
  Color bg;
  bool played;

  GamePlot({
    this.id,
    this.text = "",
    this.bg = ColorPlotAvailable,
    this.played = false,
  });
}
