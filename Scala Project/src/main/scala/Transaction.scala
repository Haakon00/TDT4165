import exceptions._
import scala.collection.mutable

object TransactionStatus extends Enumeration {
  val SUCCESS, PENDING, FAILED = Value
}
 
class TransactionQueue {

    // TODO
    // project task 1.1
    // Add datastructure to contain the transactions
    private val queue = mutable.Queue[Transaction]()

    // Remove and return the first element from the queue
    def pop: Transaction = {
        queue synchronized {
            queue.dequeue()
        }
    }

    // Return whether the queue is empty
    def isEmpty: Boolean = {
        queue synchronized {
            queue.isEmpty
        }
    }

    // Add new element to the back of the queue
    def push(t: Transaction): Unit = {
        queue synchronized {
            queue.enqueue(t)
        }
    }

    // Return the first element from the queue without removing it
    def peek: Transaction = {
        queue synchronized {
            queue.head
        }
    }

    // Return an iterator to allow you to iterate over the queue
    def iterator: Iterator[Transaction] = {
        queue synchronized {
            queue.iterator
        }
    }
}

class Transaction(val transactionsQueue: TransactionQueue,
                  val processedTransactions: TransactionQueue,
                  val from: Account,
                  val to: Account,
                  val amount: Double,
                  val allowedAttemps: Int) extends Runnable {

    var status: TransactionStatus.Value = TransactionStatus.PENDING
    var attempt = 0

    override def run: Unit = {

        def doTransaction() = {
            // TODO - project task 3
            // Extend this method to satisfy requirements.
            val withdrawal = from.withdraw(amount) // Try to withdraw
            withdrawal match {
                case Left(_)    => {
                    val tryDeposit = to.deposit(amount)
                    tryDeposit match {
                        case Left(_)     => status = TransactionStatus.SUCCESS
                        case Right(_)    => {
                            // If deposit into new account failed, add it back to owner
                            from.deposit(amount) 
                            attempt += 1
                        }
                    } 
                }
                case Right(_)    => attempt += 1
            }
            if (attempt >= allowedAttemps) { // If out of attempts, status = failed
                status = TransactionStatus.FAILED
            }
        }

        // TODO - project task 3
        // make the code below thread safe
        this synchronized {
            if (status == TransactionStatus.PENDING) {
                doTransaction
                Thread.sleep(50) // you might want this to make more room for
                                // new transactions to be added to the queue
            }
        }
    }
}
