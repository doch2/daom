import 'package:flutter/material.dart';

class Trend extends StatelessWidget {
  Trend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Trend Page"),
            SizedBox(height: _height * 0.1),
          ],
        ),
      ),
    );
  }
}