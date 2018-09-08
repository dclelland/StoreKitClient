//
//  StoreKitRequest.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import PromiseKit
import StoreKit

internal class StoreKitRequest<T>: NSObject {
    
    private var pending = Promise<T>.pending()
    
    private var retainCycle: StoreKitRequest<T>?
    
    override init() {
        super.init()
        retainCycle = self
    }
    
    var promise: Promise<T> {
        return pending.promise
    }
    
    func success(_ value: T) {
        pending.resolver.fulfill(value)
        retainCycle = nil
    }
    
    func failure(_ error: Error) {
        pending.resolver.reject(error)
        retainCycle = nil
    }
    
}
