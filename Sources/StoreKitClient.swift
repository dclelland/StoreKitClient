//
//  StoreKitClient.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//  Copyright © 2017 Daniel Clelland. All rights reserved.
//

import PromiseKit
import StoreKit

public struct StoreKitClient {
    
    /// Fetches the products associated with the given product identifiers.
    public static func getProducts(productIdentifiers: Set<String>) -> Promise<SKProductsResponse> {
        return StoreKitProductsRequest(productIdentifiers: productIdentifiers).promise
    }

    /// Attempts to complete the given payment.
    /// Will throw an error if the `SKPaymentTransaction` comes back with `.error` set.
    public static func getTransaction(payment: SKPayment) -> Promise<SKPaymentTransaction> {
        return StoreKitTransactionRequest(payment: payment).promise
    }

    /// Fetches the completed transactions.
    public static func getTransactions() -> Promise<[SKPaymentTransaction]> {
        return StoreKitTransactionsRequest().promise
    }

    /// Refreshes the In-App Purchase receipt.
    public static func getReceipt(receiptProperties properties: [String : Any]? = nil) -> Promise<SKReceiptRefreshRequest> {
        return StoreKitReceiptRequest(receiptProperties: properties).promise
    }
    
}
