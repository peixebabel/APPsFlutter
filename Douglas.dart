import 'package:flutter/material.dart';
import 'dart:async'; // pra usar a classe Timer.

// Calcula o próximo número primo quando o botão é pressionado.
void main()
{
  runApp(PrimeCalc());
}

class PrimeCalc extends StatefulWidget
{
  final String appName = "Próximo Primo";
  PrimeCalcState createState()
  {
    return PrimeCalcState();
  }
}

class PrimeCalcState extends State<PrimeCalc>
{
  bool buttonOn = true; // Ativa e desativa o botão "Próximo"
  int currentPrime = 2;
  int prime = 2;
  int exactDivisionCount = 0;
  int divisor = 2;
  void calculateNextPrimeNumber(Timer timer)
  {
    // O divisor não precisa passar da metade do número pra saber se há divisões exatas.
    if (exactDivisionCount > 0 || divisor > prime/2)
    {
      // Se há 0 divisões exatas excluindo a divisão por 1 e por si mesmo,
      // achamos o próximo primo.
      if (exactDivisionCount == 0)
      {
        setState((){
          buttonOn = true;
          currentPrime = prime;
        });
        timer.cancel();
        return;
      }
      else
      {
        prime++;
        exactDivisionCount = 0;
        divisor = 2;
      }
    }
    // Detectando divisões exatas.
    int divRest = prime % divisor;
    exactDivisionCount += divRest == 0 ? 1 : 0;
    divisor++;
  }
  
  void onNextPrime()
  {
    prime = currentPrime + 1;
    exactDivisionCount = 0;
    divisor = 2;
    // Atualizando o estado pra que a tela seja construida com o botão desativado
    setState((){
      buttonOn = false;
    });
    // Chama a função de cálculo repetidamente até que se ache o próximo número primo.
    Timer.periodic(Duration(microseconds:1), calculateNextPrimeNumber);
  }
  
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: widget.appName,
      home: Scaffold
      (
        appBar: AppBar(backgroundColor:Colors.cyan[900], title:Text(widget.appName)),
        body: Center
        (
          child:Column(children:<Widget>
          [
            SizedBox(height:160,),
            Text("$currentPrime", style:TextStyle(fontSize:60),),
            FlatButton
            (
              color:Colors.cyan[900], child:Text
              (
                "Próximo",
                style:TextStyle(color:Colors.cyan[200],),
              ),
              onPressed: buttonOn ? onNextPrime : null,
            )
          ],)
        ),
      ),
    );
  }
}
