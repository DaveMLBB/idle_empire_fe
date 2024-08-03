import 'package:flutter/foundation.dart';
import 'dart:async';

import '../models/boss.dart';
import '../models/hero.dart';
import '../models/player.dart';

class GameService extends ChangeNotifier {
  Player player;
  Timer? _idleTimer;

  GameService({required this.player}) {
    startIdleGeneration();
  }

  void startIdleGeneration() {
    _idleTimer = Timer.periodic(Duration(minutes: 1), (_) => generateIdleGold());
  }

  void generateIdleGold() {
    player.earnGold(player.idleLevel * 10); // 10 oro per livello idle ogni minuto
    notifyListeners();
  }

  void updateRanking(Player winner, Player loser) {
    int pointDifference = winner.points - loser.points;
    int pointsGained = 50 - (pointDifference ~/ 100).clamp(0, 40);
    winner.points += pointsGained;
    loser.points -= pointsGained ~/ 2;
    // Aggiorna il rank dei giocatori (implementa la logica di ranking se necessario)
    notifyListeners();
  }

  void watchAd() {
    player.earnDiamonds(5); // Guadagna 5 diamanti per ogni annuncio
    notifyListeners();
  }

  void fightBoss(Boss boss) {
    // Implementa la logica per combattere un boss
    // Se il boss viene sconfitto:
    bool defeated = player.totalPower > boss.power; // Esempio semplificato
    if (defeated) {
      player.increaseIdleLevel();
      player.earnGold(boss.goldReward);
      player.earnDiamonds(boss.diamondReward);
    }
    notifyListeners();
  }

  void upgradeHero(Hero hero, {required int goldSpent, required int diamondsSpent}) {
    player.upgradeHero(hero, goldSpent: goldSpent, diamondsSpent: diamondsSpent);
    notifyListeners();
  }

  void unlockHero(Hero hero) {
    player.unlockHero(hero);
    notifyListeners();
  }

  void addEquipmentToHero(Hero hero, Equipment equipment) {
    player.addEquipmentToHero(hero, equipment);
    notifyListeners();
  }

  void upgradeEquipment(Hero hero, Equipment equipment) {
    player.upgradeEquipment(hero, equipment);
    notifyListeners();
  }

  @override
  void dispose() {
    _idleTimer?.cancel();
    super.dispose();
  }
}