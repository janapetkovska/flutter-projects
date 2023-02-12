import 'package:flutter/material.dart';

import 'model/list_item.dart';
import 'widgets/nov_element.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(primarySwatch: Colors.pink),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _userItems = [
    ListItem(
        id: "T1",
        naslov: "Kalkulus",
        datumVreme: DateTime.parse("2023-02-01 14:30")),
    ListItem(
        id: "T2",
        naslov: "Veb programiranje",
        datumVreme: DateTime.parse("2023-02-11 08:34")),
    ListItem(
        id: "T3",
        naslov: "EMT",
        datumVreme: DateTime.parse("2023-02-25 17:52")),
    ListItem(
        id: "T4",
        naslov: "Kompjuterski mrezi",
        datumVreme: DateTime.parse("2023-02-12 12:12")),
    ListItem(
        id: "T5",
        naslov: "Algoritmi",
        datumVreme: DateTime.parse("2023-02-27 13:21")),
  ];

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NovElement(_addNewItemToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(ListItem item) {
    setState(() {
      _userItems.add(item);
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _userItems.removeWhere((elem) => elem.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kolokviumi"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add), onPressed: () => _addItemFunction(context))
      ]),
      body: Center(
        child: _userItems.isEmpty
            ? Text("No elements")
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    child: ListTile(
                      title: Text(_userItems[index].naslov,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        "${_userItems[index].datumVreme.year}-0${_userItems[index].datumVreme.month}-${_userItems[index].datumVreme.day} ${_userItems[index].datumVreme.hour}:${_userItems[index].datumVreme.minute}",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteItem(_userItems[index].id),
                      ),
                    ),
                  );
                },
                itemCount: _userItems.length,
              ),
      ),
    );
  }
}
