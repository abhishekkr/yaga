import 'package:flutter/material.dart';
import 'package:yaga/common/player.dart';
import 'package:yaga/tictactoe/constants.dart';
import 'package:yaga/tictactoe/game_data.dart';

class SidePanel extends StatefulWidget {
  GameData gameData;

  SidePanel(this.gameData);

  @override
  _SidePanel createState() => new _SidePanel();
}

class _SidePanel extends State<SidePanel> {
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
