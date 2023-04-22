import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: ShoppingListWidget(),
    );
  }
}

class ShoppingListWidget extends StatefulWidget {
  @override
  _ShoppingListWidgetState createState() => _ShoppingListWidgetState();
}

class _ShoppingListWidgetState extends State<ShoppingListWidget> {
  final List<String> _shoppingList = [
    'Manzanas',
    'Plátanos',
    'Leche',
    'Pan',
    'Queso'
  ];

  String _newItem = '';

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de la compra'),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
                child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Añade un nuevo artículo',
              ),
              onChanged: (value) {
                setState(() {
                  _newItem = value;
                });
              },
              onEditingComplete: AddNewItem,
            )),
            IconButton(onPressed: AddNewItem, icon: const Icon(Icons.add)),
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: _shoppingList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text(_shoppingList[index]),
                  trailing: IconButton(
                      onPressed: () => RemoveItem(index),
                      icon: const Icon(Icons.delete)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: AddNewItem,
        child: Icon(Icons.add),
      ),
    );
  }

  void RemoveItem(int index) {
    setState(() {
      _shoppingList.removeAt(index);
    });
  }

  void AddNewItem() {
    setState(() {
      if (_newItem != "") {
        _shoppingList.add(_newItem);
        _textEditingController.clear();
        _newItem = "";
      }
    });
  }
}
