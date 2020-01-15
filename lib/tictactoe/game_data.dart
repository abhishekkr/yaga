import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/game_plot.dart';

class GameData {
  List<GamePlot> gameMap;
  int currentPlayer;
  Player winner;
  bool gameIsOn;

  Player playerX = Player(id: 1, name: "X", isBot: false);
  Player playerO = Player(id: 2, name: "O", isBot: true);

  GameData(this.gameMap, this.currentPlayer, this.winner, this.gameIsOn);
}
