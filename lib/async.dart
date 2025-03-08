import 'package:flutter/material.dart';

class AsyncPage extends StatelessWidget {
  const AsyncPage({super.key});

  Future<List<String>> getPlayerList(kbn) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (kbn == 0) {
        return [];
      } else if (kbn == 1) {
        throw Exception("データ取得に失敗しました。");
      }

      return [
        "佐々木寿人",
        "滝沢和典",
        "伊達朱里紗",
        "高宮まり",
        "鈴木たろう",
        "園田賢",
        "渡辺太",
        "浅見真紀",
        "白鳥翔",
        "多井隆晴",
        "松本吉弘",
        "日向藍子",
        "内川幸太郎",
        "堀慎吾",
        "岡田紗佳",
        "渋川難波",
        "二階堂亜樹",
        "二階堂瑠美",
        "勝又健志",
        "松ヶ瀬隆弥",
        "小林剛",
        "瑞原明奈",
        "鈴木優",
        "仲林圭",
        "茅森早香",
        "醍醐大",
        "竹内元太",
        "浅井堂岐",
        "瀬戸熊直樹",
        "萩原聖人",
        "黒沢咲",
        "本田朋広",
      ];
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Page'),
        backgroundColor: Color.fromARGB(92, 12, 127, 228),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getPlayerList(2),
            builder: (context, snapshot) {
              // データ取得中
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.greenAccent,
                ));
              }

              // エラーが発生した場合
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              // データ取得された場合
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text("データが存在しません"));
                }

                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data![index]),
                          ),
                          Divider(),
                        ],
                      );
                    });
              }

              // デフォルトの戻り値
              return const Center(child: Text("データが存在しません"));
            }),
      ),
    );
  }
}
