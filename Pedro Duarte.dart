import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Curso_les(),debugShowCheckedModeBanner: false,));
}


class Curso_les extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Curso"),),
      body: Curso_Full(),
    );
  }
}

class Curso_Full extends StatefulWidget {
  @override
  _Curso_FullState createState() => _Curso_FullState();
}

class _Curso_FullState extends State<Curso_Full> {

  TextEditingController _textEditingController_nome=new TextEditingController();

  TextEditingController _textEditingController_curso=new TextEditingController();

  String nome,curso;
  String texto="Resultado:";
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: SingleChildScrollView(
        child: Column(
        children: <Widget>[
        
        Padding(padding: EdgeInsets.all(25),child: Text("Curso"),),

        Padding(padding: EdgeInsets.all(25),child: TextField(controller: _textEditingController_nome,cursorColor: Colors.red,keyboardType: TextInputType.text,decoration: InputDecoration(labelText: "Nome:"),),),
        
        Padding(padding: EdgeInsets.all(25),child: TextField(controller: _textEditingController_curso,cursorColor: Colors.green,keyboardType: TextInputType.text,decoration: InputDecoration(labelText: "Curso:"),),),
        Padding(padding: EdgeInsets.only(top: 20),child: RaisedButton(onPressed: (){ 
          setState(() {

              if(_textEditingController_curso.text.isEmpty||_textEditingController_nome.text.isEmpty){
                    print("Erro");
              }else{

            

          nome=_textEditingController_nome.text; curso=_textEditingController_curso.text; 
          
          texto=" Nome:  $nome \n  Curso:  $curso ";  
          _textEditingController_curso.text="";
          _textEditingController_nome.text="";    }        
          });
  }, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),color: Colors.blue,child: Icon(Icons.save,color: Colors.white,),),),
        Padding(padding: EdgeInsets.only(top: 20),child: Text("$texto",style: TextStyle(color: Colors.blueAccent),),)
      ],),
      )
    );
  }
}