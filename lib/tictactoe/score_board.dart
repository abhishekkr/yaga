import 'package:flutter/material.dart';
import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/constants.dart';
import 'package:yaga/tictactoe/game_data.dart';

class ScoreBoard extends StatefulWidget {
  GameData gameData;

  ScoreBoard(this.gameData);

  @override
  _ScoreBoard createState() => new _ScoreBoard();
}

class _ScoreBoard extends State<ScoreBoard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 150.0,
          width: 450.0,
          child: Center(
              child: new ListView(
                  padding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  children: <Widget>[
                    Text("x-o-x panel"),
                    Text(widget.gameData.winner == null ? "none" : widget.gameData.winner.name),
                    Text(widget.gameData.currentPlayer == 2 ? widget.gameData.playerO.name : widget.gameData.playerX.name),
                  ]
            ), // <GridView/>
          ), // <Center/>
    ); // <Container/>

  }
}
