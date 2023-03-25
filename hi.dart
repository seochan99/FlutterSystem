class Strong {
  final double strengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("RUNNNNNN");
  }
}

class Human {
  final String name;
  Human({required this.name});
  void sayHello() {
    print("Hello, I'm $name");
  }
}

enum Team { red, blue }

class Player with Strong, QuickRunner {
  final Team team;
  Player({
    required this.team,
  });
}

void main() {
  var player = Player(
    team: Team.red,
  );
  player.runQuick();
}
