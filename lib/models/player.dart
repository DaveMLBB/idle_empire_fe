import 'hero.dart';

class Player {
  String username;
  String email;
  String password; // Hashed
  int gold;
  int diamonds;
  List<Hero> heroes;
  int rank;
  int points;
  int idleLevel;

  Player({
    required this.username,
    required this.email,
    required this.password,
    this.gold = 0,
    this.diamonds = 0,
    List<Hero>? heroes,
    this.rank = 0,
    this.points = 1000,
    this.idleLevel = 1,
  }) : this.heroes = heroes ?? [
    Hero(name: 'Knight', role: HeroRole.Tank, power: 10, cost: 100, isUnlocked: true),
    Hero(name: 'Archer', role: HeroRole.Marksman, power: 8, cost: 80, isUnlocked: false),
    Hero(name: 'Mage', role: HeroRole.Mage, power: 12, cost: 120, isUnlocked: false),
  ];

  List<Hero> get unlockedHeroes => heroes.where((hero) => hero.isUnlocked).toList();

  void unlockHero(Hero hero) {
    if (!hero.isUnlocked && gold >= hero.cost) {
      gold -= hero.cost;
      hero.isUnlocked = true;
    }
  }

  void upgradeHero(Hero hero, {required int goldSpent, required int diamondsSpent}) {
    if (gold >= goldSpent && diamonds >= diamondsSpent) {
      gold -= goldSpent;
      diamonds -= diamondsSpent;
      hero.levelUp(goldSpent: goldSpent, diamondsSpent: diamondsSpent);
    }
  }

  void addEquipmentToHero(Hero hero, Equipment equipment) {
    if (gold >= equipment.upgradeCost) {
      gold -= equipment.upgradeCost;
      hero.addEquipment(equipment);
    }
  }

  void upgradeEquipment(Hero hero, Equipment equipment) {
    if (diamonds >= equipment.upgradeCost) {
      diamonds -= equipment.upgradeCost;
      equipment.upgrade(equipment.upgradeCost);
    }
  }

  int get totalPower => unlockedHeroes.fold(0, (sum, hero) => sum + hero.totalPower);

  void earnGold(int amount) {
    gold += amount;
  }

  void earnDiamonds(int amount) {
    diamonds += amount;
  }

  void increaseIdleLevel() {
    idleLevel++;
  }
}