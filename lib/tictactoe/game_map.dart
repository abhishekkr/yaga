import 'dart:core';
import 'package:flutter/material.dart';
import 'package:yaga/common/player.dart';
import 'package:yaga/common/custom_dialog.dart';
import 'package:yaga/tictactoe/game_plot.dart';
import 'package:yaga/tictactoe/game_data.dart';
import 'package:yaga/tictactoe/constants.dart';

class GameMap extends StatefulWidget {
  GameData gameData;

  GameMap();

  @override
  _GameMap createState() => new _GameMap();
}

class _GameMap extends State<GameMap> {
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
      if (widget.gameData.currentPlayer == widget.gameData.playerX.id) {
        plot.text = "X";
        plot.bg = ColorPlotPlayedX;
        widget.gameData.currentPlayer = widget.gameData.playerO.id;
      } else {
        plot.text = "O";
        plot.bg = ColorPlotPlayedO;
        widget.gameData.currentPlayer = widget.gameData.playerX.id;
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
      widget.gameData.gameIsOn = false;
      if (winnerXO == "X") {
        widget.gameData.winner = widget.gameData.playerX;
      } else if (winnerXO == "O") {
        widget.gameData.winner = widget.gameData.playerO;
      }
    });

    showDialog(
        context: context,
        builder: (_) => new CustomDialog(
             widget.gameData.winner.name + " won!",
            "Press reset to start again.", resetGame)
    );
  }

  void resetGame() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
      widget.gameData = GameData(
        initGamePlots(),
        -1,
        null,
        true,
      );
      widget.gameData.currentPlayer = widget.gameData.playerX.id;
    });
  }

  String didYouWin() {
    if (widget.gameData.gameMap[0].text != "") {
      if(widget.gameData.gameMap[0].text == widget.gameData.gameMap[1].text && widget.gameData.gameMap[1].text == widget.gameData.gameMap[2].text) {
        return widget.gameData.gameMap[0].text;
      }
      if(widget.gameData.gameMap[0].text == widget.gameData.gameMap[3].text && widget.gameData.gameMap[3].text == widget.gameData.gameMap[6].text) {
        return widget.gameData.gameMap[0].text;
      }
    }

    if (widget.gameData.gameMap[4].text != "") {
      if(widget.gameData.gameMap[0].text == widget.gameData.gameMap[4].text && widget.gameData.gameMap[4].text == widget.gameData.gameMap[8].text) {
        return widget.gameData.gameMap[0].text;
      }
      if(widget.gameData.gameMap[1].text == widget.gameData.gameMap[4].text && widget.gameData.gameMap[4].text == widget.gameData.gameMap[7].text) {
        return widget.gameData.gameMap[1].text;
      }
      if(widget.gameData.gameMap[2].text == widget.gameData.gameMap[4].text && widget.gameData.gameMap[4].text == widget.gameData.gameMap[6].text) {
        return widget.gameData.gameMap[2].text;
      }
      if(widget.gameData.gameMap[3].text == widget.gameData.gameMap[4].text && widget.gameData.gameMap[4].text == widget.gameData.gameMap[5].text) {
        return widget.gameData.gameMap[3].text;
      }
    }

    if (widget.gameData.gameMap[8].text != "") {
      if(widget.gameData.gameMap[2].text == widget.gameData.gameMap[5].text && widget.gameData.gameMap[5].text == widget.gameData.gameMap[8].text) {
        return widget.gameData.gameMap[2].text;
      }
      if(widget.gameData.gameMap[6].text == widget.gameData.gameMap[7].text && widget.gameData.gameMap[7].text == widget.gameData.gameMap[8].text) {
        return widget.gameData.gameMap[6].text;
      }
    }

    return "";
  }

  bool canPlayThisPlot(int plotIndex) {
    return (!widget.gameData.gameMap[plotIndex].played && widget.gameData.gameIsOn);
  }

  @override
  void initState() {
    super.initState();
    widget.gameData = GameData(
      initGamePlots(),
      -1,
      null,
      true,
    );
    if (widget.gameData.currentPlayer == -1) {
      widget.gameData.currentPlayer = widget.gameData.playerX.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 450.0,
          width: 450.0,
          child: Center(
            child: new GridView.builder(
              padding: const EdgeInsets.all(5.0),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
              ),
              itemCount: widget.gameData.gameMap.length,
              itemBuilder: (context, i) => new SizedBox(
                  width: 90.0,
                  height: 90.0,
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      child: new RaisedButton(
                          padding: const EdgeInsets.all(10.0),
                          color: widget.gameData.gameMap[i].bg,
                          disabledColor: widget.gameData.gameMap[i].bg,
                          onPressed: canPlayThisPlot(i)
                            ? () => playPlot(widget.gameData.gameMap[i])
                            : null,
                          child: new Text(
                              widget.gameData.gameMap[i].text,
                              style: TextStyle(color: ColorPlotText, fontSize: 52.0),
                          ),
                      ), // <RaisedButton/>
                    ),
                  ), // <InkWell/>
              ),
            ), // <GridView/>
          ), // <Center/>
    ); // <Container/>

  }
}
