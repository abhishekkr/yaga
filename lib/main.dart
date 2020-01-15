import 'package:flutter/material.dart';
import 'package:yaga/pages/content.dart';

void main() => runApp(Yaga());

class Yaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'YAGA| Yet Another Game App',
        theme: ThemeData(primaryColor: Colors.amber),
        home: PageContent(),
    );
  }
}
