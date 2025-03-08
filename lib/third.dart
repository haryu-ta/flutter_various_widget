import 'dart:async';

import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Timer? _timer;
  int _second = 0;
  int _counter = 0;
  bool _isProgress = true;
  int _selectedIndex = 0;
  final List<Widget> pageList = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  void initState() {
    // 1行毎に繰り返し実行するメソッド
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      _counter++;
      setState(() {
        _second = DateTime.now().second;
        if (_counter >= 10 && _second % 10 == 0) {
          _timer?.cancel();
          _isProgress = false;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
          child: _isProgress
              ? CircularProgressIndicator(
                  color: Colors.amber, value: _getProgress())
              : pageList[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 17, 223, 10),
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fire_extinguisher), label: 'Page1'),
          BottomNavigationBarItem(icon: Icon(Icons.fit_screen), label: 'Page2'),
          BottomNavigationBarItem(icon: Icon(Icons.sanitizer), label: 'Page3'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  double _getProgress() {
    return (_second % 10) / 10;
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(border: TableBorder.all(), 
    columnWidths: {
      0: IntrinsicColumnWidth(),
      1: IntrinsicColumnWidth(),
      2: FlexColumnWidth(),
    },
    children: [
      TableRow(children: [
        SizedBox(width: 50, height: 100),
        SizedBox(width: 100, height: 100),
        Container(),
      ]),
      TableRow(children: [
        SizedBox(width: 50, height: 100),
        SizedBox(width: 100, height: 100),
        Container(),
      ]),
    ]);
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Page2");
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Page3");
  }
}
