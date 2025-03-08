// チーム名を定義してチーム名は必ずここから取得する
enum Team {
  pirates("Pirates"),
  drivens("Drivens"),
  sakuraKnights("Sakuraナイツ"),
  fightClub("麻雀格闘倶楽部"),
  others("その他");

  const Team(this.name);

  final String name;

  static final Map<String,Team> _map = {
    for(final team in Team.values) team.name: team
  };

  static Team getTeamNameFromString(String name) => _map[name] ?? Team.others;
}