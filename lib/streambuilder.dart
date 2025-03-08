import 'dart:async';

import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  const StatePage({super.key});

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("===========build on===========");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('State Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: (_counter > 10) ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              _incrementCounter();
            },
            tooltip: 'Increment',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StreamBuilderPage()));
            },
            tooltip: 'next',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}


class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  final StreamController<int> controller = StreamController<int>();
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print("===========build on2===========");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('State Page2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            StreamBuilder<int>(
              stream: controller.stream,
              builder: (context, snapshot) {
                return Text(
                  '$_counter',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (_counter > 10) ? Colors.red : Colors.black,
                  ),
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter++;
            controller.sink.add(_counter);
          },
          tooltip: 'Increment',
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(Icons.add)),
    );
  }
}
