main() {
  for (int i = 99; i > 0; i--) {
    print('$i bottles of beer on the wall, $i bottles of beer. Take one down and pass it around, ${i-1} bottles of beer on the wall.');
  }

  var fruits = ['apple', 'banana', 'cherry'];
  for(String fruit in fruits){
    print('$fruit pie');
  }
}
