//
//  StoreKitTransactionRequest.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import StoreKit

internal class StoreKitTransactionRequest: StoreKitRequest<SKPaymentTransaction>, SKPaymentTransactionObserver {
    
    private let payment: SKPayment
    
    init(payment: SKPayment) {
        self.payment = payment
        super.init()
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        guard let transaction = transactions.first(where: { $0.payment == payment }) else {
            return
        }
        
        if let error = transaction.error {
            failure(error)
        } else {
            success(transaction)
        }
        
        SKPaymentQueue.default().finishTransaction(transaction)
        SKPaymentQueue.default().remove(self)
    }
    
}
