import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'flutterprojectlb3.vercel.app/api/teams';

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((team) => Team.fromJson(team)).toList();
    } else {
      throw Exception('Falha ao carregar os times');
    }
  }
}

class Team {
  final String name;
  final int players;

  Team({required this.name, required this.players});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      players: json['players'],
    );
  }
}
