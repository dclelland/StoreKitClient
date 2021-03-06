# StoreKitClient

Simple PromiseKit based client for Apple's StoreKit IAP API.

Largely based on the existing [PromiseKit/StoreKit wrapper](https://github.com/PromiseKit/StoreKit).

## Dependencies

- [PromiseKit](https://github.com/mxcl/PromiseKit/)

## Examples

Get products:

```swift
let productIdentifiers: Set<String> = /* ... get product identifers */
StoreKitClient.getProducts(productIdentifiers: productIdentifiers).then { productsResponse in
    // Handle products...
}.catch { error in
    // Handle exception...
}
```

Make a payment:

```swift
let product: SKProduct = /* ... get product from `StoreKitClient.getProducts` */
let payment: SKPayment = SKPayment(product: product)
StoreKitClient.getTransaction(payment: payment).then { transaction in
    // Check `transaction.transactionState`...
}.catch { error in
    switch ((error as NSError).domain, (error as NSError).code) {
    case (SKErrorDomain, SKError.paymentCancelled.rawValue):
        // User cancelled, don't show an error...
    default:
        // Handle exception...
    }
}
```

Get completed transactions:

```swift
StoreKitClient.getTransactions().then { transactions in
    // Handle completed transactions...
}.catch { error in
    // Handle exception...
}
```

Refresh the receipt:

```swift
StoreKitClient.getReceipt().then { receipt in
    // Check `Bundle.main.appStoreReceiptURL`...
}.catch { error in
    // Handle exception...
}
```
