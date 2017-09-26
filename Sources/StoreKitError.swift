//
//  StoreKitError.swift
//  StoreKitClient
//
//  Created by Daniel Clelland on 24/09/17.
//

import Foundation

public enum StoreKitError: Error {
    
    case paymentsUnavailable
    
    case unknown
    
}

extension StoreKitError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .paymentsUnavailable:
            return "Payments unavailable"
        case .unknown:
            return "Something went wrong."
        }
    }
    
}
