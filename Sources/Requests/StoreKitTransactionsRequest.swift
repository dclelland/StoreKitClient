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
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        self.transactions.append(contentsOf: transactions)
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        success(transactions)
        SKPaymentQueue.default().remove(self)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        failure(error)
        SKPaymentQueue.default().remove(self)
    }
    
}
