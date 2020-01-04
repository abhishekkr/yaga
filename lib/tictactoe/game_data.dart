import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/game_plot.dart';

class GameData {
  List<GamePlot> gameMap;
  var currentPlayer;
  Player winner;
  bool gameIsOn;

  var _playerX = new Player(id: 1, name: "X");
  var _playerO = new Player(id: 2, name: "O");
  Player get playerX {
    return _playerX;
  }
  Player get playerO {
    return _playerO;
  }

  GameData(this.gameMap, this.currentPlayer, this.winner, this.gameIsOn);
}
