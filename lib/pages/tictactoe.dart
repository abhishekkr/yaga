import 'package:flutter/material.dart';
import 'package:yaga/fx/route_transition.dart';
import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/game_plot.dart';
import 'package:yaga/tictactoe/game_map.dart';
import 'package:yaga/tictactoe/game_data.dart';
import 'package:yaga/tictactoe/side_panel.dart';
import 'package:yaga/tictactoe/constants.dart';

class PageTicTacToe extends StatefulWidget {
  @override
  _PageTicTacToe createState() => new _PageTicTacToe();
}

class _PageTicTacToe extends State<PageTicTacToe> {
  GameData gameData;

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

  @override
  void initState() {
    super.initState();
    this.gameData = GameData(
      initGamePlots(),
      -1,
      null,
      true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tic Tac Toe'),
      ),
      body: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 5.0),
          children: <Widget>[
            GameMap(gameData),
            SidePanel(gameData),
          ],
      ),
    ); // <Scaffold/>
  }
}
