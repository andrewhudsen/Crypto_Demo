//
//  ProgressHUD.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import Foundation
import UIKit

class ProgressHud {
    static let shared = ProgressHud()
    
    var container = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    var subContainer = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth / 3.0, height: kScreenWidth / 4.0))
    var textLabel = UILabel()
    var activityIndicatorView = UIActivityIndicatorView()
    var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    init() {
        container.backgroundColor = UIColor.clear
        
        subContainer.layer.cornerRadius = 5.0
        subContainer.layer.masksToBounds = true
        subContainer.backgroundColor = UIColor.clear
        
        activityIndicatorView.hidesWhenStopped = true
        
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        textLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        textLabel.textColor = UIColor.darkGray
        
        blurEffectView.frame = container.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func showWithBlurView() {
        
        DispatchQueue.main.async { [weak self] in
            if !UIAccessibility.isReduceTransparencyEnabled {
                self?.container.backgroundColor = UIColor.clear
                self?.container.addSubview(self?.blurEffectView ?? UIView())
            } else {
                self?.container.backgroundColor = UIColor.black.withAlphaComponent(0.65)
            }
            
            self?.activityIndicatorView.style = UIActivityIndicatorView.Style.large
            self?.activityIndicatorView.center = CGPoint(x: kScreenWidth / 2, y: kScreenHeight / 2)
            self?.activityIndicatorView.color = UIColor.white
            
            self?.activityIndicatorView.startAnimating()
            self?.container.addSubview(self?.activityIndicatorView ?? UIView())
            if let window = self?.getKeyWindow() {
                window.addSubview(self?.container ?? UIView())
            }
            self?.container.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.container.alpha = 1.0
            })
        }
    }
    
    func hide() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.container.alpha = 0.0
        }) { finished in
            self.activityIndicatorView.stopAnimating()
            
            self.activityIndicatorView.removeFromSuperview()
            self.textLabel.removeFromSuperview()
            self.subContainer.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
            self.container.removeFromSuperview()
        }
    }
    func updateProgressTitle(_ title: String?) {
        textLabel.text = title
    }
    
    private func getKeyWindow() -> UIWindow? {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return window
    }
}
