import 'package:flutter/material.dart';
import 'dart:math';

class DiscData {
  static final _rng = Random();

  double size;
  Color color;
  Alignment alignment;

  DiscData() {
    color = Color.fromARGB(
      _rng.nextInt(200),
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );
    size = _rng.nextDouble() * 40 + 10;
    alignment = Alignment(
      _rng.nextDouble() * 2 - 1,
      _rng.nextDouble() * 2 - 1,
    );
  }

  DiscData setColorPBLightBlue() {
    this.color = Color.fromARGB(255, 50, 100, 150);
    return _setPBSize();
  }

  DiscData setColorPBDarkBlue() {
    this.color = Color.fromARGB(255, 0, 0, 70);
    return _setPBSize();
  }

  DiscData _setPBSize() {
    this.size = 50;
    return this;
  }

  DiscData setAlignment(Alignment alignment) {
    this.alignment = alignment;
    return this;
  }
}

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xFF15202D),
          child: SizedBox.expand(
            child: VariousDiscs(11),
          ),
        ),
      ),
    ),
  );
}

class VariousDiscs extends StatefulWidget {
  final numberOfDiscs;

  VariousDiscs(this.numberOfDiscs);

  @override
  _VariousDiscsState createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];
  var _peixeBabel = true;

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    if (_peixeBabel == true) {
      _discs.add(
          DiscData().setColorPBDarkBlue().setAlignment(Alignment(-0.1, 0)));
      _discs.add(DiscData().setColorPBDarkBlue().setAlignment(Alignment(0, 0)));
      _discs
          .add(DiscData().setColorPBDarkBlue().setAlignment(Alignment(0.1, 0)));

      _discs.add(DiscData()
          .setColorPBLightBlue()
          .setAlignment(Alignment(-0.1, -0.15)));
      _discs.add(
          DiscData().setColorPBLightBlue().setAlignment(Alignment(0, -0.15)));
      _discs.add(
          DiscData().setColorPBDarkBlue().setAlignment(Alignment(0.1, -0.15)));

      _discs.add(
          DiscData().setColorPBDarkBlue().setAlignment(Alignment(-0.2, -0.30)));
      _discs.add(
          DiscData().setColorPBDarkBlue().setAlignment(Alignment(-0.1, -0.30)));
      _discs.add(
          DiscData().setColorPBLightBlue().setAlignment(Alignment(0, -0.30)));
      _discs.add(
          DiscData().setColorPBDarkBlue().setAlignment(Alignment(0.1, -0.30)));

      _discs.add(
          DiscData().setColorPBDarkBlue().setAlignment(Alignment(-0.1, -0.45)));
    } else {
      for (int i = 0; i < widget.numberOfDiscs; i++) {
        _discs.add(DiscData());
      }
    }
    _peixeBabel = !(_peixeBabel);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _makeDiscs();
      }),
      child: Stack(
        children: [
          Text(
            'Click a disc!',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          for (final disc in _discs)
            Positioned.fill(
              child: AnimatedAlign(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                alignment: disc.alignment,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: disc.color,
                    shape: BoxShape.rectangle,
                  ),
                  height: disc.size,
                  width: disc.size,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
