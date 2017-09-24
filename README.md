# StoreKitClient

Simple PromiseKit based client for Apple's StoreKit IAP API.

## Dependencies

- [PromiseKit](https://github.com/mxcl/PromiseKit/)

## Todo

- Test `StoreKitTransactionRequest` with the different transaction states:
    - `.purchasing`
    - `.purchased`
    - `.failed`
    - `.restored`
    - `.deferred`

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
    // Handle exception...
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
