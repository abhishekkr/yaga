import 'package:flutter/material.dart';
import 'package:yaga/pages/content.dart';

void main() => runApp(new Yaga());

class Yaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'YAGA| Yet Another Game App',
        theme: new ThemeData(primaryColor: Colors.amber),
        home: new PageContent(),
    );
  }
}
