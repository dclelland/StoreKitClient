# StoreKitClient

Simple PromiseKit based client for Apple's StoreKit IAP API.

## Dependencies

- [PromiseKit](https://github.com/mxcl/PromiseKit/)

## Interface

```
/// Fetches the products associated with the given product identifiers.
StoreKitClient.getProducts(productIdentifiers: Set<String>) -> Promise<SKProductsResponse>

/// Attempts to complete the given payment.
/// Will throw an error if the `SKPaymentTransaction` comes back with `.error` set.
StoreKitClient.getTransaction(payment: SKPayment) -> Promise<SKPaymentTransaction>

/// Fetches the completed transactions.
StoreKitClient.getTransactions() -> Promise<[SKPaymentTransaction]>

/// Refreshes the In-App Purchase receipt.
StoreKitClient.getReceipt(receiptProperties properties: [String : Any]? = nil) -> Promise<SKReceiptRefreshRequest>
```
