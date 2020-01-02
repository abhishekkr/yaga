import 'package:flutter/material.dart';
import 'package:yaga/fx/route_transition.dart';

class PageTicTacToe extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Text('x o x'),
      ),
    );
  }
}
