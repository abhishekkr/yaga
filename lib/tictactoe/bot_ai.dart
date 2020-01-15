import 'dart:core';
import 'dart:math';
import 'package:yaga/tictactoe/game_logic.dart';
import 'package:yaga/tictactoe/game_plot.dart';

class BotAI {
  static Map<String, double> scores = {
    'X': 10.0,
    'O': -10.0,
    'tie': 0.0
  };

  static int pickPlotByMinimax(String playerName, List<GamePlot> board) {
    double bestScore = double.negativeInfinity;
    int move = -1;
    for (int i = 0; i < 9; i++) {
        if (board[i].text != '') {
          continue;
        }
        // Is the spot available?
        board[i].text = playerName;
        double score = minimax(playerName, board, 0, false);
        board[i].text = '';
        if (score > bestScore) {
          bestScore = score;
          move = i;
        }
    }
    return move;
  }

  static double minimax(String playerName, List<GamePlot> board, int depth, bool isMaximizing) {
    String result = GameLogic.didYouWin(board);
    if (result == playerName) {
      return scores[result];
    }

    double bestScore;
    for (int i = 0; i < 9; i++) {
      if (board[i].text != '') {
        continue;
      }
      board[i].text = playerName;
      double score = minimax(playerName, board, depth + 1, false);
      board[i].text = '';
      if (isMaximizing) {
        bestScore = max(score, double.negativeInfinity);
      } else {
        bestScore = min(score, double.infinity);
      }
    }
    return bestScore;
  }
}
