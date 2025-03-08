import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_various_application/class/player.dart';
import 'package:widget_various_application/enum/team.dart';
import 'package:widget_various_application/mleague/detail.dart';

class MLeaguePage extends StatefulWidget {
  const MLeaguePage({super.key});

  @override
  _MLeaguePageState createState() => _MLeaguePageState();
}

class _MLeaguePageState extends State<MLeaguePage> {
  List<Player> playersList = getPlayersList();
  Map<Team, Color> teamColorMap = getColorMap();
  Map<Team, String> teamIconMap = getIconMap();

  void _addMember() {
    setState(() {
      playersList.add(Player(
        playername: "新規追加",
        assciate: "プロ麻雀",
        team: Team.others,
        sex: "male",
      ));
    });
  }

  Future<void> updatePlayersList() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      playersList.add(Player(
        playername: "新規追加2",
        assciate: "プロ麻雀",
        team: Team.others,
        sex: "female"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(216, 9, 106, 30),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: SvgPicture.asset("assets/mleague.svg",
                    width: 30, height: 30),
              ),
              Text("Mリーグ選手一覧"),
            ],
          ),
        ),
      ),
      body: Scrollbar(
        thickness: 20,
        child: RefreshIndicator(
          backgroundColor: Colors.black,
          onRefresh: () async {
            //await updatePlayersList();
          },
          child: ListView.builder(
            itemCount: playersList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      playersList[index].getPlayername,
                      style: playersList[index].getSex == 'male'
                          ? TextStyle(color: Colors.black)
                          : TextStyle(color: Colors.red),
                    ),
                    leading: SvgPicture.asset(
                      teamIconMap[playersList[index].getTeam]!,
                      width: 50,
                      height: 50,
                    ),
                    subtitle: Text(playersList[index].getAssciate),
                    subtitleTextStyle:
                        const TextStyle(color: Color.fromARGB(255, 106, 12, 228)),
                    trailing: Text(playersList[index].getTeam.name),
                    leadingAndTrailingTextStyle: TextStyle(
                        color: teamColorMap[playersList[index].getTeam]),
                    titleTextStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(
                          player: playersList[index],
                        );
                      }));
                    },
                  ),
                  Divider(),
                  //const Divider(color: Color.fromARGB(255, 179, 176, 176)),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addMember,
        tooltip: 'Increment',
        label: const Text('メンバー追加'),
      ),
    );
  }
}

// チームカラーを定義
Map<Team, Color> getColorMap() {
  Map<Team, Color> colorMap = {
    Team.pirates: Color.fromARGB(255, 20, 136, 231),
    Team.drivens: Colors.lightGreenAccent,
    Team.sakuraKnights: Colors.pinkAccent,
    Team.fightClub: const Color.fromARGB(255, 240, 147, 25),
    Team.others: Colors.black,
  };
  return colorMap;
}

// チームアイコンを定義
Map<Team, String> getIconMap() {
  Map<Team, String> iconMap = {
    Team.pirates: "assets/pirates.svg",
    Team.drivens: "assets/drivens.svg",
    Team.sakuraKnights: "assets/sakura.svg",
    Team.fightClub: "assets/konami.svg",
    Team.others: "assets/mleague.svg",
  };
  return iconMap;
}

// 選手リストを定義
List<Player> getPlayersList() {
  List<Player> playersList = [
    Player(
      playername: "小林 剛",
      assciate: "麻将連合",
      team: Team.pirates,
      sex: "male",
    ),
    Player(
        playername: "瑞原 明奈",
        assciate: "最高位戦日本プロ麻雀協会",
        team: Team.pirates,
        sex: "female"),
    Player(
      playername: "鈴木 優",
      assciate: "最高位戦日本プロ麻雀協会",
      team: Team.pirates,
      sex: "male",
    ),
    Player(
        playername: "仲林 圭",
        assciate: "日本プロ麻雀協会",
        team: Team.pirates,
        sex: "male"),
    Player(
        playername: "園田 賢",
        assciate: "最高位戦日本プロ麻雀協会",
        team: Team.drivens,
        sex: "male"),
    Player(
        playername: "鈴木 たろう",
        assciate: "最高位戦日本プロ麻雀協会",
        team: Team.drivens,
        sex: "male"),
    Player(
        playername: "渡辺 太",
        assciate: "最高位戦日本プロ麻雀協会",
        team: Team.drivens,
        sex: "male"),
    Player(
        playername: "浅見 真紀",
        assciate: "最高位戦日本プロ麻雀協会",
        team: Team.drivens,
        sex: "female"),
    Player(
        playername: "内川 幸太郎",
        assciate: "日本プロ麻雀連盟",
        team: Team.sakuraKnights,
        sex: "male"),
    Player(
        playername: "堀 慎吾",
        assciate: "日本プロ麻雀協会",
        team: Team.sakuraKnights,
        sex: "male"),
    Player(
        playername: "岡田 紗佳",
        assciate: "日本プロ麻雀連盟",
        team: Team.sakuraKnights,
        sex: "female"),
    Player(
        playername: "渋川 難波",
        assciate: "日本プロ麻雀協会",
        team: Team.sakuraKnights,
        sex: "male"),
    Player(
        playername: "佐々木 寿人",
        assciate: "日本プロ麻雀連盟",
        team: Team.fightClub,
        sex: "male"),
    Player(
        playername: "高宮 まり",
        assciate: "日本プロ麻雀連盟",
        team: Team.fightClub,
        sex: "female"),
    Player(
        playername: "滝沢 和典",
        assciate: "日本プロ麻雀連盟",
        team: Team.fightClub,
        sex: "male"),
    Player(
        playername: "伊達 朱里紗",
        assciate: "日本プロ麻雀連盟",
        team: Team.fightClub,
        sex: "female"),
  ];
  return playersList;
}
