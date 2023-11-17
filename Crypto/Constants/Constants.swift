//
//  Constants.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import Foundation
import UIKit

let SIZE_CONSTANT = 375.0
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

class CommonFunctions: NSObject {
    static func showAlert(_ title : String = "", message : String = "", completion: (( Bool) -> ())? = nil) {
        let alert = UIAlertController(title: message != "" ? title : "", message: message == "" ? title : message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            completion?(true)
        }))
        if var topController = UIWindow.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alert, animated: true, completion: nil)
        }
    }
}

enum Header {
    static let key = "X-CMC_PRO_API_KEY"
    static let value = "27c753b2-eeaa-4aae-a9f7-1aa94f12708a"
}

enum URLs {
    static let detailsAPI = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    static let logoAPI = "https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=%@&aux=logo"

}
