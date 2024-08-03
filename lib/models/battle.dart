import 'player.dart';
import 'tower.dart';
import 'inhibitor.dart';
import 'base.dart';

class Battle {
  Player player1;
  Player player2;
  List<Tower> tower1;
  List<Tower> tower2;
  List<Inhibitor> inhibitor1;
  List<Inhibitor> inhibitor2;
  Base base1;
  Base base2;

  Battle({
    required this.player1,
    required this.player2,
    required this.tower1,
    required this.tower2,
    required this.inhibitor1,
    required this.inhibitor2,
    required this.base1,
    required this.base2,
  });

  void simulateBattle() {
    // Implementa la logica di battaglia
  }
}