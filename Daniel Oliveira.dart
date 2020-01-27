import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const kAmountOfSentences = 8;

const kSentences = [
  "Já defendeu o TCC?",
  "Quantos artigos esse ano?",
  "E as namoradinhas?",
  "Essa faculdade nunca acaba?",
  "Você só estuda?",
  "Não vai passar essa roupa?",
  "Vai se atrasar!",
  "E o desafio do Peixe Babel?",
];

const kColors = [
  Colors.blue,
  Colors.red,
  Colors.blueGrey,
  Colors.purple,
  Colors.brown,
  Colors.pink,
  Colors.deepOrange,
  Colors.green,
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me pressione',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = -1;
  int previousIndex = -2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Tudo tranquilo",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  "Por enquanto 🙄",
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          if (previousIndex >= 0)
            Center(
              //A chave vai permitir reposicionar o cards dentro da tree sem perder o estado
              key: ValueKey(previousIndex),
              child: ColoredCard(
                color: kColors[previousIndex],
                text: kSentences[previousIndex],
              ),
            ),
          if (previousIndex >= 0)
            Center(
              //A chave vai reposicionar o cards dentro da tree sem perder o estado
              key: ValueKey(currentIndex),
              child: ColoredCard(
                color: kColors[currentIndex],
                text: kSentences[currentIndex],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            currentIndex = (currentIndex + 1) % kAmountOfSentences;
            previousIndex = (previousIndex + 1) % kAmountOfSentences;
          });
        },
        icon: currentIndex >= 0 ? Icon(Icons.add) : null,
        label: Text(currentIndex >= 0 ? "Pressão" : "Quero pressão"),
        backgroundColor: kColors[(currentIndex - 2) % kAmountOfSentences],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ColoredCard extends StatefulWidget {
  final Color color;
  final String text;

  const ColoredCard({
    Key key,
    this.color,
    this.text,
  }) : super(key: key);

  @override
  _ColoredCardState createState() => _ColoredCardState();
}

class _ColoredCardState extends State<ColoredCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _borderAnimation;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //Animação responsável pela borda do container, dando a impressão de expansão
    _borderAnimation = Tween(
      begin: MediaQuery.of(context).size.longestSide.toDouble(),
      end: 0.0,
    ).animate(_controller);

    //Animação responsável pelo tamanho do card, que aumenta de tamanho durante a duração da animação
    _sizeAnimation = Tween(
      begin: 0.0,
      end: MediaQuery.of(context).size.longestSide.toDouble(),
    ).animate(_controller);
    _controller.forward();

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ColoredCard oldWidget) {
    if (oldWidget.color != widget.color) {
      _controller.forward(from: 0);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _borderAnimation,
      child: Center(
        child: FittedBox(
          fit: BoxFit.none,
          child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Container(
          width: _sizeAnimation.value,
          height: _sizeAnimation.value,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(_borderAnimation.value),
              ),
              color: widget.color),
          child: child,
        );
      },
    );
  }
}
