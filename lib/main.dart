import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:widget_various_application/mleague/mleague.dart';
import 'package:widget_various_application/third.dart';
import 'webview.dart';
import 'second.dart';
import 'fourth.dart';
import 'async.dart';
import 'streambuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 12, 127, 228)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'ちいかわ図鑑'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "ちいかわに興味あるかたは",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "こちら",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("ちいかわ");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewPage()));
                      }
                  ),
                  TextSpan(
                    text: "をクリック",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ]
              )),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      "ハチワレ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    Icon(Icons.pets, size: 30, color: Colors.blueAccent),
                  ]),
                  Image.asset('assets/はちわれ.jpeg', width: 200, height: 200),
                  // 複数アイテムを非表示にする
                  if (selectedIndex == 0) ...[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "うさぎ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Icon(Icons.pets_sharp, size: 30, color: Colors.amber),
                    ]),
                    Image.network(
                        'https://chiikawa-moyou.com/wp-content/uploads/2023/05/Pasted-8-8.jpg',
                        width: 200,
                        height: 200),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "モモンガ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Icon(Icons.pets_sharp, size: 30, color: Colors.pinkAccent),
                    ]),
                    Image.network(
                        'https://pbs.twimg.com/media/FhzRtt8UUAAXxm2?format=jpg&name=large',
                        width: 200,
                        height: 200),
                  ]
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.star),
                  label: 'ハチワレ',
                  tooltip: 'はちわれ'),
              BottomNavigationBarItem(
                icon: Icon(Icons.tapas),
                activeIcon: Icon(Icons.star),
                label: 'その他',
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.primaryFixed,
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            }),
        drawer: Drawer(
            child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                duration: const Duration(seconds: 5000),
                child: const Text("Menu"),
              ),
              ListTile(
                title: const Text('M-league選手一覧'),
                trailing: const Icon(Icons.bookmark_added),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MLeaguePage()));
                },
              ),
              Divider(),
              ListTile(
                title: const Text('機能試験'),
                trailing: const Icon(Icons.coffee),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                },
              ),
              Divider(),
              ListTile(
                title: const Text('インジケータ'),
                trailing: const Icon(Icons.colorize),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
                },
              ),
              Divider(),
              ListTile(
                title: const Text('入力フォームたち'),
                trailing: const Icon(Icons.web),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FourthPage()));
                },
              ),
              Divider(),
              ListTile(
                title: const Text('非同期処理'),
                trailing: const Icon(Icons.whatshot),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AsyncPage()));
                },
              ),
              Divider(),
              ListTile(
                title: const Text('State Page'),
                trailing: const Icon(Icons.zoom_out_map),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StatePage()));
                },
              ),
            ],
          ),
        )));
  }
}
