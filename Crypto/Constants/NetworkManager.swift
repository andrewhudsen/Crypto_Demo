//
//  NetworkManager.swift
//  Crypto
//
//  Created by Andrew on 16/11/23.
//

import Foundation


class NetworkManager : NSObject {
    static let shared = NetworkManager()
    func request<T:Decodable>(_ isHUD:Bool = true, url:String, param:[String:Any]? = nil, header:[String:Any]? = nil, type:T.Type, completion:@escaping (T?) -> ()) {
        if Reachability.isConnectedToNetwork() == false {
            CommonFunctions.showAlert(message: "No Internet Connection")
            return
        }
        if isHUD { ProgressHud.shared.showWithBlurView() }
        guard let urls = URL.init(string: url) else {return}
        var request:URLRequest = URLRequest(url: urls)
        request.setValue(Header.value, forHTTPHeaderField: Header.key)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if isHUD { ProgressHud.shared.hide() }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                
                completion(response)
            } catch {
                CommonFunctions.showAlert(message: "Something went wrong")
                completion(nil)
            }
        }.resume()
    }
}




