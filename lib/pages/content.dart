import 'package:flutter/material.dart';
import 'package:yaga/fx/route_transition.dart';
import 'package:yaga/pages/tictactoe.dart';

class PageContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Yet Another Game App'),
        ),
      body: Center(
          child: RaisedButton(
            child: Text('Tic-Tac-Toe'),
            onPressed: () {
              Navigator.of(context).push(RouteTransitionSimple(widget: PageTicTacToe()));
            },
          ),
      ),
    );
  }
}
