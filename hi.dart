String capitalize(String? name) => name?.toUpperCase() ?? "No name";

void main() {
  String? name;
  name ??= "chan";

  capitalize("chan");
  capitalize(null);
}
