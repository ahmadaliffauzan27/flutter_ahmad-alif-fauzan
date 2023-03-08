void main() {
  int n1 = 10, n2 = 40, n3 = 50;

  print("$n1! = ${factorial(n1)}");
  print("$n2! = ${factorial(n2)}");
  print("$n3! = ${factorial(n3)}");
}

int factorial(int n) {
  int result = 1;
  for (int i = n; i >= 1; i--) {
    result *= i;
  }
  return result;
}
