import 'package:flutter/material.dart';

void main() {
    runApp(
        MaterialApp(
            home: App(),
            theme: ThemeData(
                hintColor: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
        )
    );
}

class App extends StatefulWidget {
    @override
    _AppState createState() => _AppState();
}

class _AppState extends State<App> {

    TextEditingController addInput = TextEditingController(); 
    List _todo = [];
    Map<String, dynamic> _lastRemoved;
    int _lastRemovedPos;

    @override
    void initState() {
        super.initState();
    }

    Future<Null> refresh() async{
        await Future.delayed(Duration(seconds: 1));
        setState(() {
            this._todo.sort(
                (a, b) {
                    if(a["status"] && !b["status"]) {
                        return 1;
                    } else if(!a["status"] && b["status"]) {
                        return -1;
                    } else {
                        return 0;
                    }
                }
            );
        });
        return Null;
    }

    void addTask() {
        setState(() {
            String text = this.addInput.text;
            this._todo.add({"title": text, "status": false});
            this.addInput.text = "";
        });
    }

    Widget buildItem(BuildContext context, int index) {
        return Dismissible(
            background: Container(
                color: Colors.red,
                child: Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Icon(Icons.delete, color: Colors.white),
                )
            ),
            direction: DismissDirection.startToEnd,
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            onDismissed: (direction) {
                setState(() {  
                    this._lastRemoved = Map.from(this._todo[index]);
                    this._lastRemovedPos = index;
                    this._todo.removeAt(index);

                    final snack = SnackBar(
                        content: Text("Task: \"${this._lastRemoved['title']}\" removed"),
                        action: SnackBarAction(
                            label: "Undo",
                            onPressed: () {
                                setState(() {
                                    this._todo.insert(this._lastRemovedPos, this._lastRemoved);
                                });
                            },
                        ),
                        duration: Duration(seconds: 3),
                    );
                    Scaffold.of(context).removeCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(snack);
                });
            },
            child: CheckboxListTile(
                title: Text(this._todo[index]["title"]),
                value: this._todo[index]["status"],
                onChanged: (status) {
                    setState(() {
                        this._todo[index]["status"] = status;
                    });
                },
                secondary: CircleAvatar(
                    child: Icon(_todo[index]["status"] ? Icons.check : Icons.error),
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Listinha da procrastinação', style: TextStyle(color: Colors.white),),
                actions: <Widget>[
                    IconButton(icon: Icon(Icons.add), onPressed: () {}, color: Colors.white)
                ],
                backgroundColor: Color(0xff1976d2),
                centerTitle: true,
            ),
            body: Column(
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    child: TextField(
                                        controller: this.addInput,
                                        decoration: InputDecoration(
                                            labelText: "Nova tarefa",
                                            labelStyle: TextStyle(color: Color(0xff1976d2))
                                        ),
                                    ),
                                ),
                                RaisedButton(
                                    child: Text("Adicionar"),
                                    onPressed: this.addTask,
                                    color: Color(0xff1976d2),
                                    textColor: Colors.white,
                                )
                            ],
                        ),
                    ),
                    Expanded(
                        child: RefreshIndicator(
                            onRefresh: this.refresh,
                            child: ListView.builder(
                                padding: EdgeInsets.only(top: 10.0),
                                itemCount: this._todo.length,
                                itemBuilder: this.buildItem,
                            ),
                        )
                    )
                ],
            ),
        );
    }
}