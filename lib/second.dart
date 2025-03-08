import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(19, 190, 233, 0.888),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Container(width: 30, height: 30, color: Colors.red),
              Spacer(),
              Container(width: 30, height: 30, color: Colors.blue),
              Spacer(),
              Container(width: 30, height: 30, color: Colors.purple),
            ],
          ),
          Row(
            children: [
              Container(width: 30, height: 30, color: Colors.blue),
              Spacer(flex:3),
              Container(width: 30, height: 30, color: Colors.purple),
              Spacer(flex:1),
              Container(width: 30, height: 30, color: Colors.red),
            ],
          ),

          // Text("asdfghjkl;qwertyuiop@zxcvbnm,.asdfghjklqwertyu"),
          // Container(
          //   // width: 50,
          //   // height: 50,
          //   color: Colors.red,
          //   constraints: BoxConstraints(
          //     maxWidth: 100,
          //     maxHeight: 100,
          //     minWidth: 20,
          //     minHeight: 20,
          //   ),
          //   //child: Icon(Icons.access_alarm_outlined),
          //   child: Text(
          //       'Hello World is Thanks\nHello World\nHello World\nHello World\nHello World\nHello World\nHello World\nHello World\nHello World'),
          // ),
          // Container(
          //     width: 100,
          //     height: 100,
          //     decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(color: Colors.black, width: 2),
          //         right: BorderSide(color: Colors.blue, width: 2),
          //         bottom: BorderSide(color: Colors.yellow, width: 2),
          //         left: BorderSide(color: Colors.red, width: 2),
          //       ),
          //       //borderRadius: BorderRadius.circular(10),
          //       gradient: SweepGradient(
          //         colors: [
          //           Color.fromRGBO(226, 113, 7, 0),
          //           Color.fromRGBO(219, 226, 7, 0.922),
          //           Color.fromRGBO(95, 226, 7, 0.885),
          //           Color.fromRGBO(7, 226, 226, 0.749),
          //           Color.fromRGBO(7, 7, 226, 0.896),
          //           Colors.pink,
          //           Colors.purple,
          //         ],
          //       ),
          //     ),
          //     child: Icon(Icons.access_alarm_outlined)),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.baseline,
          //     textBaseline: TextBaseline.alphabetic,
          //     children: [
          //       Text("500", style: TextStyle(fontSize: 60)),
          //       Text("円", style: TextStyle(fontSize: 40)),
          //     ]),
          // Container(
          //   height: 300,
          //   color: const Color.fromARGB(255, 223, 225, 225),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         Container(
          //           width: 200,
          //           height: 200,
          //           color: Colors.teal,
          //         ),
          //         Container(
          //           width: 100,
          //           height: 100,
          //           color: Colors.redAccent,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )
      ),
    );
  }
}
