import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: RandColorNum()));

class RandColorNum extends StatefulWidget {
  @override
  _RandColorNumState createState() => _RandColorNumState();
}

class _RandColorNumState extends State<RandColorNum> {
  List<Text> _numbers = new List<Text>();
  Random rand = new Random();

  Color _randColor() {
    return Color.fromRGBO(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1.0);
  }

  void _generateNum() => setState(() {
    _numbers.add(Text(rand.nextInt(100).toString(), style: TextStyle(color: _randColor(), fontSize: 20), textAlign: TextAlign.center));
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Colored Numbers'), backgroundColor: _randColor()),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        RaisedButton(child: Text('Generate', style: TextStyle( fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)), padding: EdgeInsets.all(20.0), color: _randColor(), onPressed: _generateNum),
        if(_numbers.isNotEmpty) Text(_numbers.last.data, style: TextStyle(color:_numbers.last.style.color, fontSize: 40), textAlign: TextAlign.center),
        Expanded(child: GridView.count(crossAxisCount: 10, children: <Widget>[for(Text n in _numbers.reversed)n]))]));
  }
}