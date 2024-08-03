enum HeroRole { Tank, Support, Assassin, Mage, Marksman, Fighter }

class Hero {
  String name;
  HeroRole role;
  int level;
  int power;
  int cost;
  bool isUnlocked;
  List<Equipment> equipment;

  Hero({
    required this.name,
    required this.role,
    this.level = 1,
    required this.power,
    required this.cost,
    this.isUnlocked = false,
    this.equipment = const [],
  });

  void levelUp({required int goldSpent, required int diamondsSpent}) {
    level++;
    power += (power * 0.1).round(); // Aumenta il potere del 10% ad ogni livello
    cost = (cost * 1.5).round(); // Aumenta il costo del 50% ad ogni livello
  }

  void addEquipment(Equipment item) {
    equipment.add(item);
    power += item.powerBonus;
  }

  void removeEquipment(Equipment item) {
    equipment.remove(item);
    power -= item.powerBonus;
  }

  int get totalPower {
    int equipmentPower = equipment.fold(0, (sum, item) => sum + item.powerBonus);
    return power + equipmentPower;
  }
}

class Equipment {
  String name;
  int powerBonus;
  int level;
  int upgradeCost;

  Equipment({
    required this.name,
    required this.powerBonus,
    this.level = 1,
    required this.upgradeCost,
  });

  void upgrade(int diamondsSpent) {
    level++;
    powerBonus += (powerBonus * 0.2).round(); // Aumenta il bonus di potere del 20% ad ogni upgrade
    upgradeCost = (upgradeCost * 1.3).round(); // Aumenta il costo di upgrade del 30% ogni volta
  }
}