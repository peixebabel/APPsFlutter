import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';   // Package necessário para persistência dos itens na memória

void main() => runApp(ListaCompras());

class ListaCompras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Lista de Compras",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  showAlertDialog(BuildContext context) {
    if (widget.items.isNotEmpty) {
      // set up the buttons
      Widget cancelButton = FlatButton(
        child: Text("CANCELAR"),
        onPressed: () => Navigator.of(context).pop(),
      );
      Widget continueButton = FlatButton(
        child: Text("LIMPAR"),
        onPressed: limparLista,
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Apagar a lista"),
        content: Text("Deseja apagar toda a lista?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  void addItem() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(
        Item(
          title: newTaskCtrl.text,
          done: false,
        ),
      );
      newTaskCtrl.clear();
//      save();
    });
  }

  void removeItem(int index) {
    setState(() {
      widget.items.removeAt(index);
//      save();
    });
  }

  void limparLista() {
    setState(() {
      widget.items.clear();
    });
    Navigator.of(context).pop();
//    save();
  }

  // Função para carregar os itens armazenados na memória - depende do pacote "shared_preferences: ^0.5.3"
//  Future load() async {
//    var prefs = await SharedPreferences.getInstance();
//    var data = prefs.getString('data');
//
//    if (data != null) {
//      Iterable decoded = jsonDecode(data);
//      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
//      setState(() {
//        widget.items = result;
//      });
//    }
//  }

  // Função para armazenar os itens armazenados na memória - depende do pacote "shared_preferences: ^0.5.3"
//  save() async {
//    var prefs = await SharedPreferences.getInstance();
//    await prefs.setString('data', jsonEncode(widget.items));
//    print('salvou');
//  }
//
//
  // Chama a função LOAD ao inicializar o app
//  _HomePageState() {
//    load();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//          leading: Icon(Icons.shopping_cart),
        title: Text(
          "Lista de Compras",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => showAlertDialog(context),
            icon: Icon(
              Icons.remove_shopping_cart,
              size: 30,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            autocorrect: true,
            controller: newTaskCtrl,
            cursorWidth: 3,
            decoration: InputDecoration(
              labelText: "Novo Item",
              labelStyle: TextStyle(
                color: Colors.deepPurple,
              ),
              hintText: "ex: tomates",
              hintStyle: TextStyle(color: Colors.grey[500]),
              prefixIcon: Icon(Icons.add_shopping_cart),
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                color: Colors.red,
                iconSize: 25,
                onPressed: addItem,
              ),
              contentPadding: EdgeInsets.all(10.0),
            ),
            enableSuggestions: true,
            onFieldSubmitted: (v) => addItem(),
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple[900],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.items[index];
                return Dismissible(
                  onDismissed: (direction) {
                    removeItem(index);
                  },
                  background: Container(
                    color: Colors.grey[200],
                  ),
                  key: Key(item.title),
                  child: CheckboxListTile(
                    checkColor: Colors.white,
                    selected: true,
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    value: item.done,
                    onChanged: (value) {
                      setState(() {
                        item.done = value;
//                        save();
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          child: Center(
            child: Text(
              "by Celso Araújo",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          color: Colors.deepPurple[100],
          height: 35.0,
        ),
      ),
    );
  }
}

class Item {
  String title;
  bool done;

  Item({this.title, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    return data;
  }
}
