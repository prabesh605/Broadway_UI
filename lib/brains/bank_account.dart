class BankAccount {
  String owner;
  double balance;

  // Constructor
  BankAccount(this.owner, this.balance);

  // // Getter
  // String get owner => _owner;
  // double get balance => _balance;

  //   // Setter
  // set owner(String newName) {
  //   if (newName.isNotEmpty) {
  //     _owner = newName;
  //   }
  // }

  void deposit(double amount) {
    balance += amount;
    print("$owner has Deposited $amount. New balance: $balance");
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      // _balance -= amount;
      balance = balance - amount;
      print("Withdrew $amount. Remaining balance: $balance");
    } else {
      print("Insufficient balance!");
    }
  }
}
