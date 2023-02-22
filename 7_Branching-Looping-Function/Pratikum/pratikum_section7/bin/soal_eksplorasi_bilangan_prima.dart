void main() {
  int num = 12;
  
  if (isPrime(num)) {
    print("$num adalah bilangan prima");
  } else {
    print("$num bukan bilangan prima");
  }
}

bool isPrime(int num) {
  if (num <= 1) {
    return false;
  }
  
  for (int i = 2; i <= num / 2; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  
  return true;
}
