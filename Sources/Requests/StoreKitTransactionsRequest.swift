//
//  StoreKitTransactionsRequest.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import StoreKit

internal class StoreKitTransactionsRequest: StoreKitRequest<[SKPaymentTransaction]>, SKPaymentTransactionObserver {
    
    private var transactions: [SKPaymentTransaction] = []
    
    override init() {
        super.init()
        
        guard SKPaymentQueue.canMakePayments() else {
            failure(StoreKitError.paymentsUnavailable)
            return
        }
        
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                self.transactions.append(transaction)
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                self.transactions.append(transaction)
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        success(transactions)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        failure(error)
    }
    
}
