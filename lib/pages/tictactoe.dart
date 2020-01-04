import 'package:flutter/material.dart';
import 'package:yaga/fx/route_transition.dart';
import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/game_plot.dart';
import 'package:yaga/tictactoe/constants.dart';

class PageTicTacToe extends StatefulWidget {
  @override
  _PageTicTacToe createState() => new _PageTicTacToe();
}

class _PageTicTacToe extends State<PageTicTacToe> {
  List<GamePlot> gameMap;
  var playerX = new Player(id: 1, name: "X");
  var playerO = new Player(id: 2, name: "O");
  var currentPlayer = -1;
  Player winner;
  bool gameIsOn = true;

  List<GamePlot> initGamePlots() {
    return <GamePlot>[
       new GamePlot(id: 1),
       new GamePlot(id: 2),
       new GamePlot(id: 3),
       new GamePlot(id: 4),
       new GamePlot(id: 5),
       new GamePlot(id: 6),
       new GamePlot(id: 7),
       new GamePlot(id: 8),
       new GamePlot(id: 9),
    ]; // gameMap
  }

  void playPlot(GamePlot plot) {
    setState(() {
      if (currentPlayer == playerX.id) {
        plot.text = "X";
        plot.bg = ColorPlotPlayedX;
        currentPlayer = playerO.id;
      } else {
        plot.text = "O";
        plot.bg = ColorPlotPlayedO;
        currentPlayer = playerX.id;
      }
      plot.played = true;
    });

    endGame();
  }

  void endGame() {
    var winnerXO = didYouWin();
    if (winnerXO == "") {
      return;
    }

    setState(() {
      gameIsOn = false;
      if (winnerXO == "X") {
        winner = playerX;
      } else if (winnerXO == "O") {
        winner = playerO;
      }
    });
  }

  String didYouWin() {
    if (gameMap[0].text != "") {
      if(gameMap[0].text == gameMap[1].text && gameMap[1].text == gameMap[2].text) {
        return gameMap[0].text;
      }
      if(gameMap[0].text == gameMap[3].text && gameMap[3].text == gameMap[6].text) {
        return gameMap[0].text;
      }
    }

    if (gameMap[4].text != "") {
      if(gameMap[0].text == gameMap[4].text && gameMap[4].text == gameMap[8].text) {
        return gameMap[0].text;
      }
      if(gameMap[1].text == gameMap[4].text && gameMap[4].text == gameMap[7].text) {
        return gameMap[1].text;
      }
      if(gameMap[2].text == gameMap[4].text && gameMap[4].text == gameMap[6].text) {
        return gameMap[2].text;
      }
      if(gameMap[3].text == gameMap[4].text && gameMap[4].text == gameMap[5].text) {
        return gameMap[3].text;
      }
    }

    if (gameMap[8].text != "") {
      if(gameMap[2].text == gameMap[5].text && gameMap[5].text == gameMap[8].text) {
        return gameMap[2].text;
      }
      if(gameMap[6].text == gameMap[7].text && gameMap[7].text == gameMap[8].text) {
        return gameMap[6].text;
      }
    }

    return "";
  }

  bool canPlayThisPlot(int plotIndex) {
    return (!gameMap[plotIndex].played && gameIsOn);
  }

  @override
  void initState() {
    super.initState();
    gameMap = initGamePlots();
    currentPlayer = playerX.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tic Tac Toe'),
      ),
      body: Center(
          child: new GridView.builder(
            padding: const EdgeInsets.all(5.0),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
            ),
            itemCount: gameMap.length,
            itemBuilder: (context, i) => new SizedBox(
                width: 100.0,
                height: 100.0,
                child: new RaisedButton(
                    padding: const EdgeInsets.all(10.0),
                    color: gameMap[i].bg,
                    disabledColor: gameMap[i].bg,
                    onPressed: canPlayThisPlot(i)
                      ? () => playPlot(gameMap[i])
                      : null,
                    child: new Text(
                        gameMap[i].text,
                        style: TextStyle(color: ColorPlotText, fontSize: 52.0),
                    ),
                ),
            ),
          ), // <body/>
      ),
    );
  }
}
