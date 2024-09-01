void main() {
  int add({int n1 = 0, int n2 = 0}) {
    return n1 + n2;
  }

  int multiply(int n1, int n2) {
    return n1 * n2;
  }

  int step1Result = add(n1: 5, n2: 9);

  int step2Result = multiply(step1Result, 5);

  double finalResult = step2Result / 3;

  print(finalResult);
}
