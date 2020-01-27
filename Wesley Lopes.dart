

import 'package:flutter/material.dart';

import 'dart:math';



void main() {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,

    home: Home(),

  ));

}



class Home extends StatefulWidget {

  @override

  _State createState() => _State();

}



class _State extends State<Home> {

  var _frases = [

    "Os problemas são oportunidades para se mostrar o que sabe.",

    "Nossos fracassos, às vezes, são mais frutíferos do que os êxitos.",

    "Tente de novo. Fracasse de novo. Mas fracasse melhor.",

    "É costume de um tolo, quando erra, queixar-se dos outros. É costume de um sábio queixar-se de si mesmo",
    "Uma boa cabeça e um bom coração formam sempre uma combinação formidável",
    "Se você não tem item de controle, você não tem gerência",
    "O maior prêmio que a vida oferece é trabalhar em algo que valha a pena",
    "Um bom porta-voz transforma leite desnatado em chantilly",
    "Um líder genuíno é motivador: orienta as pessoas, não as dirige; envolve, não as coage",
    "O objetivo do marketing de relacionamento é a retenção de clientes",
    "Aqueles que nada fazem estão sempre dispostos a criticar os que fazem algo",
    "As empresas terão de adaptar-se às preferências individuais de cada consumidor ou sucumbirão",
    "Sente-se sufocado aquele sem um objetivo de vida",
    "Todo mundo é capaz de dominar uma dor, exceto quem a sente",
    "A convicção é inútil – a menos que se transforme em conduta",
    "Quanto mais distante o administrador do administrado, menos eficiente a administração",
    "A felicidade não é algo pronto. Ela vem de suas próprias ações",
    "Devemos seguir o exemplo dos rios: dão suas águas ao mar e nunca ficam vazios",
    "Meu maior poder como consultor é ser ignorante e fazer algumas perguntas",
    
    

  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";



  void _gerarFrase() {

    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {

      _fraseGerada = _frases[numeroSorteado];

    });

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("Frases do Dia"),

        backgroundColor: Colors.green,

      ),

      body: Center(

        child: Container(

          padding: EdgeInsets.all(16),

          width: double.infinity,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              Image.asset('images/logo.png'),

              Text(

                _fraseGerada,

                textAlign: TextAlign.justify,

                style: TextStyle(

                  fontSize: 17,

                  fontStyle: FontStyle.italic,

                  color: Colors.black,

                ),

              ),

              RaisedButton(

                child: Text(

                  "Nova Frase",

                  style: TextStyle(

                      fontSize: 25,

                      color: Colors.white,

                      fontWeight: FontWeight.bold),

                ),

                color: Colors.green,

                onPressed: _gerarFrase,

              )

            ],

          ),

        ),

      ),

    );

  }

}

