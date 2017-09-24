//
//  StoreKitReceiptRequest.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import StoreKit

internal class StoreKitReceiptRequest: StoreKitRequest<SKReceiptRefreshRequest>, SKRequestDelegate {
    
    init(receiptProperties properties: [String : Any]? = nil) {
        super.init()
        let request = SKReceiptRefreshRequest(receiptProperties: properties)
        request.delegate = self
        request.start()
    }
    
    func requestDidFinish(_ request: SKRequest) {
        guard let request = request as? SKReceiptRefreshRequest else {
            failure(StoreKitError.unknown)
            return
        }
        
        success(request)
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        failure(error)
    }
    
}
