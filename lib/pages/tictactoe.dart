import 'package:flutter/material.dart';
import 'package:yaga/fx/route_transition.dart';
import 'package:yaga/tictactoe/game_map.dart';
import 'package:yaga/tictactoe/side_panel.dart';

class PageTicTacToe extends StatefulWidget {
  @override
  _PageTicTacToe createState() => new _PageTicTacToe();
}

class _PageTicTacToe extends State<PageTicTacToe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tic Tac Toe'),
      ),
      body: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 5.0),
          children: <Widget>[
            GameMap(),
            //SidePanel(gameData),
          ],
      ),
    ); // <Scaffold/>
  }
}
