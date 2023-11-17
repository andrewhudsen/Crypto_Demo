//
//  Extensions.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import Foundation
import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderColor: CGColor  {
        get {
            return layer.borderColor ?? UIColor.gray.cgColor
        } set {
            layer.borderColor = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat  {
        get {
            return layer.borderWidth
        } set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var cornerRadius: CGFloat  {
        get {
            return self.cornerRadius
        } set {
            layer.borderWidth = newValue
            layoutSubviews()
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UIColor.red.cgColor
        clipsToBounds = true
    }
}

@IBDesignable extension UISearchBar {
    @IBInspectable var cornerRadius: CGFloat  {
        get {
            return searchTextField.layer.cornerRadius
        }set{
            searchTextField.layer.cornerRadius = 15
            searchTextField.layer.masksToBounds = true
        }
    }
}

extension UIImageView {
    func imageFromUrl(urlString: String) {
        let urlRequest:URLRequest = URLRequest(url: URL.init(string: urlString)!)
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: urlRequest) {data,response,error in
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)!
                }
            }.resume()
        }
    }
}

extension UIWindow {
    static var keyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
