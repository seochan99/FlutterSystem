class Player {
  final String name = 'chan';
  int xp = 1500;

  void sayHello() {
    var name;
    print('Hello, ${this.name}');
  }
}

void main() {
  var player = Player();
  player.sayHello();
}
