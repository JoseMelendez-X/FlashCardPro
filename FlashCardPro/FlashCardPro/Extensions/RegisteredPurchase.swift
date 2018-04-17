//
//  RegisteredPurchase.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/17/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import Foundation
import UIKit

enum RegisteredPurchase: String {
    case unlimitedDecks = "unlimitedDecks"
}

class  NetworkActivityManager: NSObject {
    private static var loadingCount = 0
    class func NetworkOperationStarted(){
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    loadingCount += 1
    }
    class func networkOperationFinished() {
        if loadingCount > 0 {
            loadingCount -= 1
        }
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
