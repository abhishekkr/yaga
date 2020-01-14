import 'package:flutter/material.dart';
import 'package:yaga/common/constants.dart';
import 'package:yaga/fx/route_transition.dart';
import 'package:yaga/pages/tictactoe.dart';

class PageContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Yet Another Game App'),
        ),
        body: Center(
          child: Container(
                color: ColorContentBg,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image.asset(
                            ImgAppBanner,
                            fit: BoxFit.cover,
                            height: 150.0,
                            width: 300.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 200.0,
                          height: 40.0,
                          child: RaisedButton(
                            child: Text('Tic-Tac-Toe',
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorContentBtn, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                            color: Colors.amber,
                            onPressed: () {
                              Navigator.of(context).push(RouteTransitionSimple(widget: PageTicTacToe()));
                            },
                          ), // <RaisedButton/> tic-tac-toe
                        ), // <ButtonTheme/>
                      ), // <Container/>
                    ), // <Expanded/>
                    SizedBox(
                      height: 100.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: Text("licensed under: CC BY-SA"),
                    ),
                  ],
                ), // <<ROW/>
              ), // <Container/>
        ), //<Center/>
    );
  }
}
