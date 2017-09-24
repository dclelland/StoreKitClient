//
//  StoreKitProductsRequest.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import StoreKit

internal class StoreKitProductsRequest: StoreKitRequest<SKProductsResponse>, SKProductsRequestDelegate {
    
    init(productIdentifiers: Set<String>) {
        super.init()
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }
    
    @objc func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        success(response)
    }
    
    @objc func request(_ request: SKRequest, didFailWithError error: Error) {
        failure(error)
    }
    
}
