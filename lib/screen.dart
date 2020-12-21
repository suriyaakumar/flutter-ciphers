import 'package:flutter/material.dart';
import 'widgets.dart';

class Screen extends StatefulWidget {
  final title;

  Screen({this.title});
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
          caesar 
        ],
      ),
    );
  }
}
