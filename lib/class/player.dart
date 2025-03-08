

// 選手情報を定義するクラス
import 'package:widget_various_application/enum/team.dart';

class Player {
  String playername;
  String assciate;
  Team team;
  String sex;

  Player({
    required this.playername,
    required this.assciate,
    required this.team,
    required this.sex,
  });

  
  String get getPlayername => playername;
  String get getAssciate => assciate;
  Team get getTeam => team;
  String get getSex => sex;
}