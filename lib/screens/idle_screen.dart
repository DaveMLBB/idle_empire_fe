import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/game_services.dart';

class IdleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameService = Provider.of<GameService>(context);
    final player = gameService.player;

    return Scaffold(
      appBar: AppBar(title: Text('Idle Empire')),
      body: Column(
        children: [
          Text('Idle Level: ${player.idleLevel}'),
          Text('Gold: ${player.gold}'),
          ElevatedButton(
            onPressed: () {
              // Naviga alla schermata di combattimento con il boss
            },
            child: Text('Fight Boss'),
          ),
        ],
      ),
    );
  }
}