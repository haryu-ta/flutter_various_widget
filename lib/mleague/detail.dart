import 'package:flutter/material.dart';
import 'package:widget_various_application/class/player.dart';

class DetailPage extends StatelessWidget {
  final Player player;

  const DetailPage({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text("Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("名字 : " + player.playername.split(" ")[0]),
            Text("名前 : " + player.playername.split(" ")[1]),
          ],
        )
      ),
    );
  }
}