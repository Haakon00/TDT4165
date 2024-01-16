import exceptions._

class Account(val bank: Bank, initialBalance: Double) {

    class Balance(var amount: Double) {}

    val balance = new Balance(initialBalance)

    // TODO
    // for project task 1.2: implement functions
    // for project task 1.3: change return type and update function bodies
    def withdraw(amount: Double): Either[Double, String] = {
        balance synchronized {
            if (amount > balance.amount) { // Not enough money
                Right("Not sufficient funds")
            } else if (amount < 0) { // Negative withdrawal
                Right("Illegal amount! Please use positive numbers only.")
            } else { // Success!
                balance.amount -= amount
                Left(amount)
            }
        }
    }

    def deposit (amount: Double): Either[Double, String] = {
        balance synchronized {
            if (amount < 0){ // Negative deposit
                Right("Illegal amount! Please use positive numbers only.")
            } else { // Success!
                balance.amount += amount
                Left(balance.amount)
            }
        }
    }
    def getBalanceAmount: Double = {
        this.balance.amount
    }
    
    def transferTo(account: Account, amount: Double) = {
        bank addTransactionToQueue (this, account, amount)
    }


}
