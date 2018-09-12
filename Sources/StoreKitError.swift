//
//  StoreKitError.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import Foundation
import PromiseKit
import StoreKit

public enum StoreKitError: Error {
    
    case paymentsUnavailable
    
    case unknown
    
}

extension StoreKitError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .paymentsUnavailable:
            return "Payments are unavailable."
        case .unknown:
            return "Something went wrong."
        }
    }
    
}

extension SKError: CancellableError {
    
    public var isCancelled: Bool {
        switch code {
        case .paymentCancelled:
            return true
        default:
            return false
        }
    }
    
}
