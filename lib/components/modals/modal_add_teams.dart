import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/main.dart';

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
      widget.onAddTeam(name, players);
      Navigator.pop(context);
    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Campos não preenchidos',
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Por favor preencha todas os campos corretamente.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Entendi'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Adicionar time',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 40, 104),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: AppColors.colorDarkBlue),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      side: const BorderSide(
                          width: 0, color: Colors.transparent)),
                  backgroundColor: Colors.grey[50],
                  padding: const EdgeInsets.all(10),
                ),
              ),
            ],
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
          const SizedBox(height: 40.0),
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
