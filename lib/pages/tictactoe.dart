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
      didYouWin(plot);
    });
  }

  void didYouWin(GamePlot plot) {
   // 
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
                    onPressed: !gameMap[i].played
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
