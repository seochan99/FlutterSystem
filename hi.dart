abstract class Human {
  void walk();
}

enum Team { red, blue }

class Player extends Human {
  String name;
  int xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hello, my name is $name");
  }

  void walk() {
    print("Player walking");
  }
}

class Coach extends Human {
  String name;
  int xp;

  Coach({
    required this.name,
    required this.xp,
  });

  void walk() {
    print("Coach walking");
  }
}

void main() {
  var chan = Player(
    name: 'chan',
    xp: 1200,
    team: Team.red,
  );
  var seo = chan
    ..name = "nico"
    ..xp = 1000
    ..team = Team.blue
    ..sayHello();
}
