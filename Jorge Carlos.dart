import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Pessoas',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyClass(),
  ));
}

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool listStyle = true;

  List persons = [
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhora',
        'first': 'Alberta',
        'last': 'da Cunha'
      },
      'location' : {
        'street': {
          'number': 1971,
          'name': 'Rua Rio de Janeiro'
        },
        'city': 'Simões Filho',
        'state': 'Mato Grosso do Sul',
        'country': 'Brasil',
      },
      'age': {
        'date': '1951-09-27T22:43:59.669Z',
        'age': 26
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/34.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/34.jpg',
      },
      'favorite': true,
      'email': 'alberta.dacunha@example.com',
      'registered': '2007-08-18T08:51:50.232Z',
      'phone': '(36) 1377-8859',
      'cell': '(05) 3794-9724'
    },
    {
      'gender': 'Masculino',
      'name': {
        'title': 'Senhor',
        'first': 'Alexandre',
        'last': 'De Assis Rocha'
      },
      'location' : {
        'street': {
          'number': 8596,
          'name': 'Rua São Jorge'
        },
        'city': 'Caxias',
        'state': 'Rio de Janeiro',
        'country': 'Brasil',
      },
      'age': {
        'date': '1975-03-14T01:45:06.702Z',
        'age': 44
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/men/9.jpg',
        'med': 'https://randomuser.me/api/portraits/med/men/9.jpg',
      },
      'favorite': true,
      'email': 'deassis.rocha@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(24) 7526-5929',
      'cell': '(68) 7039-2349'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Lizaine',
        'last': 'Gomes'
      },
      'location' : {
        'street': {
          'number': 712,
          'name': 'Rua São Paulo'
        },
        'city': 'Santo André',
        'state': 'Rio Grande do Norte',
        'country': 'Brasil',
      },
      'age': {
        'date': '1994-12-14T22:21:16.353Z',
        'age': 25
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/49.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/49.jpg',
      },
      'favorite': true,
      'email': 'lizaine.gomes@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(83) 6387-3690',
      'cell': '(51) 9211-5513'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Leonarda',
        'last': 'Santos'
      },
      'location' : {
        'street': {
          'number': 2060,
          'name': 'Rua Dezenove de Outubro'
        },
        'city': 'Curitiba',
        'state': 'Mato Grosso do Sul',
        'country': 'Brasil',
      },
      'age': {
        'date': '1967-12-09T01:45:55.730Z',
        'age': 37
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/42.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/42.jpg',
      },
      'favorite': false,
      'email': 'leonarda.santos@example.com',
      'registered': '2018-02-15T18:56:32.418Z',
      'phone': '(07) 1387-3695',
      'cell': '(06) 2876-8075'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Zanete',
        'last': 'Costa'
      },
      'location' : {
        'street': {
          'number': 2532,
          'name': 'Rua Santa Rita'
        },
        'city': 'Marituba',
        'state': 'Santa Catarina',
        'country': 'Brasil',
      },
      'age': {
        'date': '1983-12-03T17:07:10.498Z',
        'age': 36
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/28.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/28.jpg',
      },
      'favorite': false,
      'email': 'zanete.costa@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(20) 0994-1823',
      'cell': '(79) 2149-6936'
    },
    {
      'gender': 'Masculino',
      'name': {
        'title': 'Senhor',
        'first': 'Vili',
        'last': 'da Rosa'
      },
      'location' : {
        'street': {
          'number': 1236,
          'name': 'Rua Dois'
        },
        'city': 'São José dos Pinhais',
        'state': 'Paraíba',
        'country': 'Brasil',
      },
      'age': {
        'date': '1966-02-20T01:57:53.522Z',
        'age': 53
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/men/53.jpg',
        'med': 'https://randomuser.me/api/portraits/med/men/53.jpg',
      },
      'favorite': false,
      'email': 'vili.darosa@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(76) 7816-8032',
      'cell': '(32) 1575-2736'
    },
    {
      'gender': 'Masculino',
      'name': {
        'title': 'Senhor',
        'first': 'Evaldo',
        'last': 'da Rosa'
      },
      'location' : {
        'street': {
          'number': 5805,
          'name': 'Travessa dos Açorianos'
        },
        'city': 'Francisco Morato',
        'state': 'Amapá',
        'country': 'Brasil',
      },
      'age': {
        'date': '1951-08-25T09:53:12.335Z',
        'age': 20
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/men/85.jpg',
        'med': 'https://randomuser.me/api/portraits/med/men/85.jpg',
      },
      'favorite': false,
      'email': 'evaldo.darosa@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(08) 4166-9086',
      'cell': '(10) 8701-1384'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Geci',
        'last': 'Jesus'
      },
      'location' : {
        'street': {
          'number': 738,
          'name': 'Rua Dois'
        },
        'city': 'São José dos Campos',
        'state': 'Paraíba',
        'country': 'Brasil',
      },
      'age': {
        'date': '1956-11-29T07:55:09.360Z',
        'age': 25
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/54.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/54.jpg',
      },
      'favorite': true,
      'email': 'geci.jesus@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(36) 5650-2488',
      'cell': '(83) 1254-3275'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Aureliana',
        'last': 'Duarte'
      },
      'location' : {
        'street': {
          'number': 5576,
          'name': 'Rua da Paz'
        },
        'city': 'Salto',
        'state': 'Rio Grande do Sul',
        'country': 'Brasil',
      },
      'age': {
        'date': '1949-11-22T17:04:58.466Z',
        'age': 19
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/70.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/70.jpg',
      },
      'favorite': false,
      'email': 'aureliana.duarte@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(59) 0294-8113',
      'cell': '(85) 9362-4071'
    },
    {
      'gender': 'Masculino',
      'name': {
        'title': 'Senhor',
        'first': 'Nadir',
        'last': 'Ramos'
      },
      'location' : {
        'street': {
          'number': 9265,
          'name': 'Rua Minas Gerais'
        },
        'city': 'São Caetano do Sul',
        'state': 'São Paulo',
        'country': 'Brasil',
      },
      'age': {
        'date': '1970-10-07T20:54:18.300Z',
        'age': 49
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/men/21.jpg',
        'med': 'https://randomuser.me/api/portraits/med/men/21.jpg',
      },
      'favorite': false,
      'email': 'nadir.ramos@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(48) 2679-1780',
      'cell': '(09) 3125-4677'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Beatrice',
        'last': 'Souza'
      },
      'location' : {
        'street': {
          'number': 8696,
          'name': 'Rua Santa Maria'
        },
        'city': 'Uberaba',
        'state': 'Roraima',
        'country': 'Brasil',
      },
      'age': {
        'date': '1990-10-22T13:52:47.646Z',
        'age': 29
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/20.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/20.jpg',
      },
      'favorite': false,
      'email': 'beatrice.souza@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(41) 5900-4954',
      'cell': '(79) 1824-1565'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhora',
        'first': 'Mírcia',
        'last': 'Rocha'
      },
      'location' : {
        'street': {
          'number': 4037,
          'name': 'Rua Onze'
        },
        'city': 'São Mateus',
        'state': 'Pará',
        'country': 'Brasil',
      },
      'age': {
        'date': '1963-12-19T07:11:02.214Z',
        'age': 56
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/52.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/52.jpg',
      },
      'favorite': true,
      'email': 'mircia.rocha@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(63) 2782-1123',
      'cell': '(86) 6780-8284'
    },
    {
      'gender': 'Feminino',
      'name': {
        'title': 'Senhorita',
        'first': 'Louise',
        'last': 'Almeida'
      },
      'location' : {
        'street': {
          'number': 4284,
          'name': 'Rua Santa Maria'
        },
        'city': 'Sertãozinho',
        'state': 'Amazonas',
        'country': 'Brasil',
      },
      'age': {
        'date': '1947-08-14T08:19:17.834Z',
        'age': 30
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/women/40.jpg',
        'med': 'https://randomuser.me/api/portraits/med/women/40.jpg',
      },
      'favorite': false,
      'email': 'louise.almeida@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(45) 2672-8941',
      'cell': '(36) 2189-2642'
    },
    {
      'gender': 'Masculino',
      'name': {
        'title': 'Senhor',
        'first': 'Cássio',
        'last': 'de Souza'
      },
      'location' : {
        'street': {
          'number': 4835,
          'name': 'Rua Dom Pedro Ii'
        },
        'city': 'Porto Alegre',
        'state': 'Rio Grande do Norte',
        'country': 'Brasil',
      },
      'age': {
        'date': '1955-12-02T05:55:32.152Z',
        'age': 25
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/men/86.jpg',
        'med': 'https://randomuser.me/api/portraits/med/men/86.jpg',
      },
      'favorite': false,
      'email': 'cassio.desouza@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(95) 9652-8704',
      'cell': '(37) 0431-1875'
    },
    {
      'gender': 'Masculino',
      'name': {
        'title': 'Senhor',
        'first': 'Samuel',
        'last': 'Barros'
      },
      'location' : {
        'street': {
          'number': 9629,
          'name': 'Rua Um'
        },
        'city': 'Cachoeirinha',
        'state': 'Pará',
        'country': 'Brasil',
      },
      'age': {
        'date': '1995-06-14T08:25:54.011Z',
        'age': 24
      },
      'image': {
        'large': 'https://randomuser.me/api/portraits/men/57.jpg',
        'med': 'https://randomuser.me/api/portraits/med/men/57.jpg',
      },
      'favorite': false,
      'email': 'samuel.barros@example.com',
      'registered': '2011-09-19T15:52:16.900Z',
      'phone': '(16) 0232-0467',
      'cell': '(68) 7619-3720'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: Container(),
        appBar: AppBar(
          title: Text('Pessoas'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.grid_on, color: Colors.white),
              onPressed: () {
                setState(() {
                  listStyle = false;
                });
              },
            ),
            FlatButton(
              child: Icon(Icons.view_list, color: Colors.white,),
              onPressed: () {
                setState(() {
                  listStyle = true;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: listStyle ? list(context) : grid(context),
        )
    );
  }

  Widget grid(context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.25
      ),
      itemBuilder:(context, index) {
        return personItemGrid(context, persons[index], index);
      },
      itemCount: persons.length,
    );
  }

  Widget list(context) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        return personItem(context, persons[index], index);
      },
    );
  }

  Widget personItem(context, person, index) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Image.network(person['image']['med']),
              title: Text(person['name']['first'] + ' ' + person['name']['last'] + ' - ' + person['age']['age'].toString()),
              subtitle: Text(person['email']),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  deleteButton(person, index),
                  favoriteButton(person, index),
                  FlatButton(
                    child: Icon(Icons.person),
                    onPressed: () {
                      openDialog(context, person, index);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget personItemGrid(context, person, index) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(person['image']['large'])
                )
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(person['name']['first'] + ' ' + person['name']['last'] + ' - ' + person['age']['age'].toString()),
                  Text(person['email']),
                ],
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  deleteButton(person, index),
                  favoriteButton(person, index),
                  FlatButton(
                    child: const Text('Ver Mais'),
                    onPressed: () {
                      openDialog(context, person, index);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openDialog(context, person, index) {
    AlertDialog alerta = AlertDialog(
      title: Text('Informações de ' + person['name']['first'] + ' ' + person['name']['last']),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(person['image']['large']),
            separator('Pessoal'),
            ListTile(
              title: personDataFormat('Genero', person['gender']),
            ),
            ListTile(
              title: personDataFormat('Nome', person['name']['first'] + ' ' + person['name']['last']),
            ),
            ListTile(
              title: personDataFormat('Titulo', person['name']['title']),
            ),
            ListTile(
              title: personDataFormat('Email',person['email']),
            ),
            ListTile(
              title: personDataFormat('Celular', person['cell']),
            ),
            ListTile(
              title: personDataFormat('Telefone', person['phone']),
            ),
            ListTile(
              title: personDataFormat('Idade', person['age']['age'].toString()),
            ),
            separator('Endereço'),
            ListTile(
              title: personDataFormat('Rua/Av.', person['location']['street']['name']),
            ),
            ListTile(
              title: personDataFormat('Nº', person['location']['street']['number'].toString()),
            ),
            ListTile(
              title: personDataFormat('Cidade', person['location']['city']),
            ),
            ListTile(
              title: personDataFormat('Estado', person['location']['state']),
            ),
            ListTile(
              title: personDataFormat('País', person['location']['country']),
            ),
          ],
        ),
      ),
      actions: [
        deleteButton(person, index),
        favoriteButton(person, index),
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alerta;
        });
  }

  Widget personDataFormat(type, value) {
    return Row(
      children: <Widget>[
        Text(type + ': ',
            style: TextStyle(
                fontWeight: FontWeight.bold
            )
        ),
        Text(value, style: TextStyle(
            fontStyle: FontStyle.italic,
        ))
      ],
    );
  }

  Widget separator(text) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(text, style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20
      ),),
    );
  }

  Widget favoriteButton(person, index) {
    return person['favorite'] ? FlatButton(
      child: Icon(Icons.star, color: Colors.yellowAccent,),
      onPressed: () {
        setFavorite(index, false);
        _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text(person['name']['first'] + ' removido(a) dos favoritos com sucesso!'),
              action: SnackBarAction(
                label: 'Desfazer',
                onPressed: () {
                  setFavorite(index, true);
                },
              ),
            )
        );
      },
    ) : FlatButton(
      child: Icon(Icons.star_border),
      onPressed: () {
        setFavorite(index, true);
        _scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: Text(person['name']['first'] + ' adicionado(a) aos favoritos com sucesso!'),
            action: SnackBarAction(
              label: 'Desfazer',
              onPressed: () {
                setFavorite(index, false);
              },
            ),
          )
        );
      },
    );
  }

  Widget deleteButton(person, index) {
    return FlatButton(
      child: Icon(Icons.delete, color: Colors.red,),
      onPressed: () {
        setState(() {
          persons.removeAt(index);
        });
        _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text(person['name']['first'] + ' removido(a) com sucesso!'),
              action: SnackBarAction(
                label: 'Desfazer',
                onPressed: () {
                  setState(() {
                    persons.insert(index, person);
                  });
                },
              ),
            )
        );
      },
    );
  }

  setFavorite(index, value) {
    setState(() {
      persons[index]['favorite'] = value;
    });
  }
}
