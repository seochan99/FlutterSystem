String sayHello(String name, int age, [String? contry = 'cuba']) =>
    "Hi, my name is $name, I'm $age years old and I'm from $contry";

void main() {
  var results = sayHello("nico", 12);
  print(results);
}
