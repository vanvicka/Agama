import 'package:flutter/material.dart';


class Status extends StatelessWidget {

  int noOfSuccess;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text("You Found: $noOfSuccess" ),


        ],
      ),
    );
  }
}
