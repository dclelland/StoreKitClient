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
        
        guard SKPaymentQueue.canMakePayments() else {
            failure(StoreKitError.paymentsUnavailable)
            return
        }
        
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        guard let transaction = transactions.first(where: { $0.payment == payment }) else {
            return
        }
        
        switch transaction.transactionState {
        case .purchased:
            SKPaymentQueue.default().finishTransaction(transaction)
            success(transaction)
        case .failed:
            SKPaymentQueue.default().finishTransaction(transaction)
            failure(transaction.error ?? StoreKitError.unknown)
        default:
            break
        }
    }
    
}
