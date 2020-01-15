import 'dart:core';
import 'package:flutter/material.dart';
import 'package:yaga/common/custom_dialog.dart';
import 'package:yaga/tictactoe/game_plot.dart';
import 'package:yaga/tictactoe/game_data.dart';
import 'package:yaga/tictactoe/game_logic.dart';
import 'package:yaga/tictactoe/constants.dart';
import 'package:yaga/tictactoe/score_board.dart';
import 'package:yaga/tictactoe/bot_ai.dart';

class GameMap extends StatefulWidget {
  GameData gameData;

  GameMap();

  @override
  _GameMap createState() => _GameMap();
}

class _GameMap extends State<GameMap> {
  List<GamePlot> initGamePlots() {
    return <GamePlot>[
       GamePlot(id: 1),
       GamePlot(id: 2),
       GamePlot(id: 3),
       GamePlot(id: 4),
       GamePlot(id: 5),
       GamePlot(id: 6),
       GamePlot(id: 7),
       GamePlot(id: 8),
       GamePlot(id: 9),
    ]; // gameMap
  }

  void playPlot(GamePlot plot) {
    playPlotById(plot.id - 1);
  }

  void ifBotThenAutoPlay() {
    String playerName;
    if (widget.gameData.currentPlayer == widget.gameData.playerX.id && widget.gameData.playerX.isBot) {
      playerName = 'X';
    } else if (widget.gameData.currentPlayer == widget.gameData.playerO.id && widget.gameData.playerO.isBot) {
      playerName = 'O';
    } else {
      return;
    }

    int plotIdToPlay = BotAI.pickPlotByMinimax(playerName, widget.gameData.gameMap);
    playPlotById(plotIdToPlay);
  }

  void playPlotById(int plotId) {
    GamePlot plot = widget.gameData.gameMap[plotId];

    setState(() {
      plot.text = playerNameById(widget.gameData.currentPlayer);
      plot.bg = playerBgById(widget.gameData.currentPlayer);
      widget.gameData.currentPlayer = nextPlayerId();
      plot.played = true;
    });

    if (endGame()) {
      snackBar('Game Over!');
      return;
    } else {
      String playerName = playerNameById(widget.gameData.currentPlayer);
      snackBar((playerName + "'s turn"));
    }

    ifBotThenAutoPlay();
  }

  void snackBar(String msg) {
    final snack = SnackBar(
        content: Text(msg),
        duration: const Duration(microseconds: 300000),
    );
    Scaffold.of(context).showSnackBar(snack);
  }

  String playerNameById(int playerId) {
    return (playerId == widget.gameData.playerX.id ? "X" : "O");
  }

  Color playerBgById(int playerId) {
    return (playerId == widget.gameData.playerX.id ?
         ColorPlotPlayedX : ColorPlotPlayedO);
  }

  int nextPlayerId() {
    return (widget.gameData.currentPlayer == widget.gameData.playerX.id ?
         widget.gameData.playerO.id : widget.gameData.playerX.id);
  }

  bool endGame() {
    var winnerXO = GameLogic.didYouWin(widget.gameData.gameMap);
    if (winnerXO == "") {
      if (widget.gameData.gameMap.every((plot) => plot.text != "")) {
        alertGameTie();
        return true;
      }
      return false;
    }

    setState(() {
      widget.gameData.gameIsOn = false;
      if (winnerXO == "X") {
        widget.gameData.winner = widget.gameData.playerX;
      } else if (winnerXO == "O") {
        widget.gameData.winner = widget.gameData.playerO;
      }
    });

    alertGameWon();
    return true;
  }

  void alertGameTie() {
    showDialog(
        context: context,
        builder: (_) => CustomDialog(
            "game has tied!",
            "Press reset to start again.", resetGame)
    );
  }

  void alertGameWon() {
    showDialog(
        context: context,
        builder: (_) => CustomDialog(
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
    ifBotThenAutoPlay();
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
    ifBotThenAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
                 children: <Widget>[
                   SizedBox(
                     height: 5.0,
                   ),
                   GridView.builder(
                     shrinkWrap: true,
                     padding: const EdgeInsets.all(5.0),
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 3,
                         childAspectRatio: 1.0,
                         crossAxisSpacing: 10.0,
                         mainAxisSpacing: 10.0,
                     ),
                     itemCount: widget.gameData.gameMap.length,
                     itemBuilder: (context, i) => SizedBox(
                         width: 90.0,
                         height: 90.0,
                         child: InkWell(
                           child: Container(
                             padding: EdgeInsets.all(3.0),
                             child: RaisedButton(
                                 padding: const EdgeInsets.all(10.0),
                                 color: widget.gameData.gameMap[i].bg,
                                 disabledColor: widget.gameData.gameMap[i].bg,
                                 onPressed: canPlayThisPlot(i)
                                   ? () => playPlot(widget.gameData.gameMap[i])
                                   : null,
                                 child: Text(
                                     widget.gameData.gameMap[i].text,
                                     style: TextStyle(color: ColorPlotText, fontSize: 52.0),
                                 ),
                             ), // <RaisedButton/>
                           ),
                         ), // <InkWell/>
                     ),
                   ), // <GridView/>
                   SizedBox(
                     height: 10.0,
                   ),
                  ScoreBoard(widget.gameData),
                 ],
          ); // <Column/>
  }
}
