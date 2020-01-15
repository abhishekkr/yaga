import 'package:flutter/material.dart';
import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/constants.dart';
import 'package:yaga/tictactoe/game_data.dart';

class ScoreBoard extends StatefulWidget {
  GameData gameData;

  ScoreBoard(this.gameData);

  @override
  _ScoreBoard createState() => _ScoreBoard();
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
              child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  children: <Widget>[
                    Text(widget.gameData.winner == null ?
                        "Game is still on. Playing turn of " + (widget.gameData.currentPlayer == 2 ? widget.gameData.playerO.name : widget.gameData.playerX.name):
                        ("Winner: " + widget.gameData.winner.name)),
                    SizedBox(height:10.0),
                    Text("X is played by " + (widget.gameData.playerX.isBot ? "Bot" : "Human")),
                    Container(
                        height: 20.0,
                        width: 20.0,
                        child: Switch(
                          value: widget.gameData.playerX.isBot,
                          onChanged: (value) {
                            setState(() {
                              widget.gameData.playerX.isBot = value;
                            });
                          },
                          activeTrackColor: Colors.amberAccent,
                          activeColor: Colors.amber,
                        ),
                    ),
                    SizedBox(height:10.0),
                    Text("O is played by " + (widget.gameData.playerO.isBot ? "Bot" : "Human")),
                    Container(
                        height: 20.0,
                        width: 20.0,
                        child: Switch(
                          value: widget.gameData.playerO.isBot,
                          onChanged: (value) {
                            setState(() {
                              widget.gameData.playerO.isBot = value;
                            });
                          },
                          activeTrackColor: Colors.amberAccent,
                          activeColor: Colors.amber,
                        ),
                    ),
                  ]
            ), // <GridView/>
          ), // <Center/>
    ); // <Container/>

  }
}
