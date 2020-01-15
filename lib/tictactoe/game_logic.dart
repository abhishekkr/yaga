import 'dart:core';
import 'package:yaga/tictactoe/game_plot.dart';

class GameLogic {
  static String didYouWin(List<GamePlot> gamePlots) {
    if (gamePlots[0].text != "") {
      if(gamePlots[0].text == gamePlots[1].text && gamePlots[1].text == gamePlots[2].text) {
        return gamePlots[0].text;
      }
      if(gamePlots[0].text == gamePlots[3].text && gamePlots[3].text == gamePlots[6].text) {
        return gamePlots[0].text;
      }
    }

    if (gamePlots[4].text != "") {
      if(gamePlots[0].text == gamePlots[4].text && gamePlots[4].text == gamePlots[8].text) {
        return gamePlots[0].text;
      }
      if(gamePlots[1].text == gamePlots[4].text && gamePlots[4].text == gamePlots[7].text) {
        return gamePlots[1].text;
      }
      if(gamePlots[2].text == gamePlots[4].text && gamePlots[4].text == gamePlots[6].text) {
        return gamePlots[2].text;
      }
      if(gamePlots[3].text == gamePlots[4].text && gamePlots[4].text == gamePlots[5].text) {
        return gamePlots[3].text;
      }
    }

    if (gamePlots[8].text != "") {
      if(gamePlots[2].text == gamePlots[5].text && gamePlots[5].text == gamePlots[8].text) {
        return gamePlots[2].text;
      }
      if(gamePlots[6].text == gamePlots[7].text && gamePlots[7].text == gamePlots[8].text) {
        return gamePlots[6].text;
      }
    }

    return "";
  }
}
