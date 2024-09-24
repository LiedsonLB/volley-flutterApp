import 'package:flutter/material.dart';

class ModalAddTeams extends StatefulWidget {
  final Function(String, int) onAddTeam;

  const ModalAddTeams({super.key, required this.onAddTeam});

  @override
  _ModalAddTeamsState createState() => _ModalAddTeamsState();
}

class _ModalAddTeamsState extends State<ModalAddTeams> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _playersController = TextEditingController();

  void _addTeam() {
    final String name = _nameController.text;
    final int? players = int.tryParse(_playersController.text);

    if (name.isNotEmpty && players != null) {
      widget.onAddTeam(name, players); // Corrigido para usar widget.onAddTeam
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos corretamente.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Adicionar time',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 6, 40, 104),
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nome do time',
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _playersController,
            decoration: const InputDecoration(
              labelText: 'Número de jogadores',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              backgroundColor: const Color.fromARGB(255, 6, 40, 104),
              foregroundColor: Colors.grey[50],
              padding: const EdgeInsets.all(20),
            ),
            onPressed: _addTeam,
            child: const Center(
              child: Text(
                'Adicionar',
                style: TextStyle(
                  fontFamily: 'ConcertOne',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
