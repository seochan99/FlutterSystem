typedef ListOfInts = List<int>;

ListOfInts reverse(ListOfInts list) {
  return list.reversed.toList();
}

void main(){
  print(reverse([1,2,3,4,5]));
}