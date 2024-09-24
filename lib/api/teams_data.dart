class TeamData {
  final String name;
  final int players;

  TeamData({required this.name, required this.players});

  @override
  String toString() {
    return 'TeamData(name: $name, players: $players)';
  }
}

List<TeamData> teams = [
  TeamData(name: 'Sicranos', players: 3),
  TeamData(name: 'Autoconvidados', players: 3),
  TeamData(name: 'Ziraldos', players: 4),
  TeamData(name: 'Sparrings', players: 5),
];
