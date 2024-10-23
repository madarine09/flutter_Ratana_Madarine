class BankAccount {
  final int id;
  final String owner;
  double _balance;

  // Main constructor
  BankAccount(this.id, this.owner, this._balance);

  // Named constructor for savings account
  BankAccount.savings(int id, String owner, double initialBalance)
      : this(id, owner, initialBalance);

  // Named constructor for checking account
  BankAccount.checking(int id, String owner) 
      : this(id, owner, 0.0);

  // Getter method to retrieve balance
  double getBalance() {
    return _balance;
  }

  // Method to withdraw funds
  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient balance');
    }
    _balance -= amount;
  }

  // Method to deposit funds
  void deposit(double amount) {
    _balance += amount;
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  // Constructor with named parameter
  Bank({required this.name});

  // Method to open a new account
  BankAccount openAccount(int id, String owner) {
    // Check if account ID is unique
    for (var account in _accounts) {
      if (account.id == id) {
        throw Exception('Account ID already exists');
      }
    }

    // Create and add new account
    var newAccount = BankAccount(id, owner, 0.0);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  // Create a new bank
  Bank bank = Bank(name: "Global Bank");
  BankAccount account1 = bank.openAccount(200, 'Alex');

  print("Balance: \$${account1.getBalance()}"); // Balance: $0.0
  account1.deposit(250);
  print("Balance: \$${account1.getBalance()}"); // Balance: $250.0
  account1.withdraw(100);
  print("Balance: \$${account1.getBalance()}"); // Balance: $150.0

  try {
    account1.withdraw(200); // Will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance
  }

  try {
    bank.openAccount(200, 'Chris'); // Will throw an exception
  } catch (e) {
    print(e); // Output: Account ID already exists
  }
}
