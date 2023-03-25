class Player {
  String name;
  int xp;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hello, my name is $name");
  }
}

void main() {
  var chan = Player(name: 'chan', xp: 1200, team: 'red')
  var seo = chan
    ..name = "nico"
    ..xp = 1000
    ..team = "blue"
    ..sayHello();
}
