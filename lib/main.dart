import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Сортировщик'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = List.generate(10, (index) => Random().nextInt(100), growable: false);

  void _randomize() {
    setState(() {
      list = List.generate(10, (index) => Random().nextInt(100), growable: false);
    });
  }

  void _sort() {
    setState(() {
      list.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: _sort,
            child: const Icon(Icons.sort),
          )
        ],
        title: Text(widget.title),
      ),
      body: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: TextField(
              controller: TextEditingController(text: list[index].toString()),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
              onSubmitted: (str) {
                list[index] = int.tryParse(str) ?? list[index];
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomize,
        tooltip: 'Randomize',
        child: Image.asset(
          'assets/dice.png',
          height: 40,
          width: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
