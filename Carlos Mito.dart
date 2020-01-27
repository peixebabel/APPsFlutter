import 'package:flutter/material.dart';
import 'dart:math';

// Tá meio mal escrito, estou começando, desculpa aí

class RadioData {
  String description;
  IconData icon;
  bool selected;

  RadioData(this.description, this.icon, this.selected);
}

class RadioIconButtonGrid extends StatefulWidget {
  final List<RadioData> radioDataList;
  final Color gridColor;

  const RadioIconButtonGrid({Key key, this.radioDataList, this.gridColor})
      : super(key: key);

  @override
  _RadioIconButtonGridState createState() => _RadioIconButtonGridState();
}

class _RadioIconButtonGridState extends State<RadioIconButtonGrid> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buildRadioIconButtonList() {
      return widget.radioDataList.map((item) {
        return FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {
            setState(() {
              widget.radioDataList
                  .forEach((otherItem) => otherItem.selected = false);
              item.selected = true;
            });
          },
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.5, color: widget.gridColor),
                  color: item.selected ? widget.gridColor : Colors.transparent,
                ),
                child: Center(
                  child: Icon(
                    item.icon,
                    color: item.selected ? Colors.white : widget.gridColor,
                    size: 34.0,
                  ),
                ),
              ),
            ),
            Text(
              item.description,
              style: TextStyle(
                  color: widget.gridColor,
                  fontSize: 16.0,
                  fontWeight:
                      item.selected ? FontWeight.bold : FontWeight.normal),
            ),
          ]),
        );
      }).toList();
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.0),
      child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        children: buildRadioIconButtonList(),
      ),
    );
  }
}

class ConfigurationItem {
  final List<RadioData> options;
  final String title;
  final Color color;

  ConfigurationItem(this.options, this.title, this.color);
}

class ConfigurationPage extends StatelessWidget {
  final List<ConfigurationItem> configurationList;

  const ConfigurationPage({Key key, this.configurationList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Configurações'),
          backgroundColor: Colors.deepPurple[900]),
      body: ListView(
        children: configurationList.map((topic) {
          return Column(children: <Widget>[
            Container(
              color: topic.color,
              width: double.infinity,
              height: 40.0,
              child: Center(
                child: Text(
                  topic.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            RadioIconButtonGrid(
              radioDataList: topic.options,
              gridColor: topic.color,
            ),
          ]);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done, color: Colors.white),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pop(context, configurationList);
        },
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        primaryIconTheme: IconThemeData(color: Colors.white),
      ),
      home: MyHomePage(title: 'Aplicativo de Simpatias'),
    );
  }
}

class CurrentConfigurationBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  const CurrentConfigurationBarItem(
      {Key key, this.icon, this.title, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: backgroundColor),
          ),
        ),
      ],
    );
  }
}

class CurrentConfigurationBar extends StatelessWidget {
  final List<RadioData> listSetup;
  final Color itemColor;

  const CurrentConfigurationBar({Key key, this.listSetup, this.itemColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 300.0,
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listSetup.map((item) {
            return Expanded(
              child: CurrentConfigurationBarItem(
                  icon: item.icon,
                  title: item.description,
                  backgroundColor: itemColor),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// =====================================================================================
// Atividades e complexidade básicas
// =====================================================================================
List<String> atividades = ['Comer', 'Usar', 'Andar', 'Guardar'];

List<String> frutas = [
  ' uvas',
  ' romãs',
  ' lixias',
];

// Complemento de USAR / ROUPAS
List<String> cores = [
  ' amarelas',
  ' brancas',
  ' pretas',
  ' vermelhas',
  ' azuis',
];

List<String> roupas = [
  ' camisetas',
  ' roupas íntimas',
  ' pulseiras',
  ' roupas',
];

List<String> locais = [
  ' pela casa',
  ' ao redor da casa',
  ' pela praia',
  ' pelo parque',
];

List<String> objetos = [
  ' sementes de romã',
  ' moedas de 50 centavos',
  ' sementes de uva',
  ' quartzos rosa',
];

List<List<String>> complemento = [frutas, roupas, locais, objetos];

// =====================================================================================
// Complementos para complexidade média
// =====================================================================================
List<String> comerMedio = [
  ' em 1 minuto',
  ' com canela',
  ' nas 12 badaladas da meia noite'
];

List<String> usarMedio = [
  ' durante o dia inteiro',
  ' à meia noite',
  ' do avesso',
];

List<String> andarMedio = [
  ' à meia noite',
  ' ao meio-dia',
  ' de costas',
];

List<String> guardarMedio = [
  ' dentro da gaveta',
  ' dentro do guarda-roupa',
  ' em cima da cômoda',
];

List<List<String>> complementoMedio = [
  comerMedio,
  usarMedio,
  andarMedio,
  guardarMedio
];

// =====================================================================================
// Complementos para complexidade complexa
// =====================================================================================
List<String> comerComplexo = [
  ' em cima da cadeira',
  ' embaixo da mesa',
  ' ao lado de uma pessoa que você goste',
];

List<String> usarComplexo = [
  ' que tenham sido guardadas perto de uma rosa durante uma semana',
  ' que não tenham sido usadas por pelo menos um mês',
  ' que já tenham sido usadas várias vezes',
];

List<String> andarComplexo = [
  ' de chinelo',
  ' segurando um pedaço de papel com o seu nome escrito',
  ' sem nenhum acessório no corpo',
];

List<String> guardarComplexo = [
  ' embrulhados em um pano',
  ' lavados com sal grosso',
  ' pelo resto do ano',
];

List<List<String>> complementoComplexo = [
  comerComplexo,
  usarComplexo,
  andarComplexo,
  guardarComplexo
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RadioData> stepsOptions = [
    new RadioData('Passo', Icons.looks_one, true),
    new RadioData('Passos', Icons.looks_two, false),
    new RadioData('Passos', Icons.looks_3, false),
  ];

  List<RadioData> purposeOptions = [
    new RadioData('Amor', Icons.favorite, true),
    new RadioData('Dinheiro', Icons.attach_money, false),
    new RadioData('Felicidade', Icons.sentiment_very_satisfied, false),
    new RadioData('Sorte', Icons.star, false),
    new RadioData('Família', Icons.group, false),
  ];

  List<RadioData> complexityOptions = [
    new RadioData('Simples', Icons.today, true),
    new RadioData('Médio', Icons.date_range, false),
    new RadioData('Complexo', Icons.event_note, false),
  ];

  List<ConfigurationItem> setup;

  List<List<String>> propositoSimpatia = [
    [
      'conquistar a pessoa amada',
      'arranjar um(a) namorado(a)',
      'encontrar o amor da sua vida',
    ],
    [
      'ganhar dinheiro',
      'ter sucesso no trabalho',
      'ganhar na loteria',
    ],
    [
      'encontrar a felicidade',
      'passar bons momentos',
      'ter paz e sossego',
    ],
    [
      'ter um ano melhor',
      'atrair mais sorte',
      'tirar o azar',
    ],
    [
      'que seus familiares passem por bons momentos',
      'ajudar no ano dos familiares',
      'melhorar o relacionamento com os amigos e a família',
    ],
  ];

  String propositoTela = 'Gerador de Simpatias';

  final randomObject = new Random();

  List<String> simpatiaAtual = [];
  String passoTela = 'Aperte o botão de simpatia para gerar os passos';
  int stepIndex = 0, purposeIndex = 0, complexityIndex = 0;

  List<RadioData> currentConfiguration = [];

  int passoIndex = 1;
  int randomNumber = 1;

  // =====================================================================================
  // Função de gerar um passo na simpatia
  // =====================================================================================
  void gerarPasso(int complexityLevel) {
    String simpatia = atividades[randomNumber];

    if (randomNumber == 3 || randomNumber == 0) {
      simpatia += ' ${2 + randomObject.nextInt(9)}';
    }

    simpatia += complemento[randomNumber]
        [randomObject.nextInt(complemento[randomNumber].length)];

    if (randomNumber == 1) {
      simpatia += cores[randomObject.nextInt(cores.length)];
    }

    if (complexityLevel > 0) {
      simpatia += complementoMedio[randomNumber]
          [randomObject.nextInt(complementoMedio[randomNumber].length)];
    }

    if (complexityLevel > 1) {
      simpatia += complementoComplexo[randomNumber]
          [randomObject.nextInt(complementoComplexo[randomNumber].length)];
    }

    simpatiaAtual.add(simpatia);
  }

  void updateCurrentConfiguration() {
    int counter = 0;

    currentConfiguration.clear();
    stepsOptions.forEach((item) {
      if (item.selected) {
        currentConfiguration.add(item);
        stepIndex = counter;
      }
      counter++;
    });

    counter = 0;

    purposeOptions.forEach((item) {
      if (item.selected) {
        currentConfiguration.add(item);
        purposeIndex = counter;
      }
      counter++;
    });

    counter = 0;

    complexityOptions.forEach((item) {
      if (item.selected) {
        currentConfiguration.add(item);
        complexityIndex = counter;
      }
      counter++;
    });
  }

  @override
  void initState() {
    setup = [
      new ConfigurationItem(stepsOptions, 'QUANTIDADE', Colors.deepPurple[800]),
      new ConfigurationItem(
          purposeOptions, 'PROPÓSITO', Colors.deepPurple[600]),
      new ConfigurationItem(
          complexityOptions, 'COMPLEXIDADE', Colors.deepPurple),
    ];
    updateCurrentConfiguration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ConfigurationPage(configurationList: setup)))
                  .then((configurations) {
                if (configurations != null) {
                  passoIndex = 1;
                  propositoTela = 'Gerador de Simpatias';
                  passoTela = 'Aperte o botão de simpatia para gerar os passos';
                  simpatiaAtual.clear();
                  setup = configurations;
                  updateCurrentConfiguration();
                }
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CurrentConfigurationBar(
              listSetup: currentConfiguration,
              itemColor: Colors.purple,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedOverflowBox(
                size: Size(double.infinity, 50.0),
                child: Text(
                  propositoTela.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.purple[300],
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text(
                      'Passo $passoIndex: $passoTela',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.4,
                        color: Colors.deepPurple[900],
                      ),
                      textAlign: TextAlign.center,
                  
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Icon(
                          Icons.navigate_before,
                          color: Colors.white,
                          size: 38.0,
                        ),
                      ),
                      onPressed: () {
                        if (passoIndex > 1) {
                          setState(() {
                            passoIndex--;
                            passoTela = simpatiaAtual[passoIndex - 1];
                          });
                        }
                      },
                    ),
                  ),
                  FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Text(
                        'Simpatia',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    color: Colors.deepPurple,
                    onPressed: () {
                      setState(() {
                        passoIndex = 1;
                        simpatiaAtual.clear();

                        for (int i = 0; i <= stepIndex; i++) {
                          randomNumber =
                              randomObject.nextInt(atividades.length);
                          gerarPasso(complexityIndex);
                        }

                        passoTela = simpatiaAtual[passoIndex - 1];
                        propositoTela =
                            'Simpatia para ${propositoSimpatia[purposeIndex][randomObject.nextInt(propositoSimpatia[purposeIndex].length)]}';
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 38.0,
                        ),
                      ),
                      onPressed: () {
                        if (passoIndex <= stepIndex) {
                          setState(() {
                            passoIndex++;
                            passoTela = simpatiaAtual[passoIndex - 1];
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
