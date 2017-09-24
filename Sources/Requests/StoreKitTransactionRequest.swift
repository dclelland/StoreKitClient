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
    
    override func success(_ value: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(value)
        SKPaymentQueue.default().remove(self)
        super.success(value)
    }
    
    override func failure(_ error: Error) {
        SKPaymentQueue.default().remove(self)
        super.failure(error)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        guard let transaction = transactions.first(where: { $0.payment == payment }) else {
            return
        }
        
        switch transaction.transactionState {
        case .purchased:
            success(transaction)
        case .failed:
            failure(transaction.error ?? StoreKitError.unknown)
        default:
            break
        }
    }
    
}
