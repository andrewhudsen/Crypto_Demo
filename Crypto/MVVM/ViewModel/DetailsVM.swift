//
//  DetailsVM.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import Foundation

var arrrr:[String]!
class DetailsVM: NSObject {
    
    var bind: () -> () = {}
    var bindToView: () -> () = {}
    var ids:String!
    var responseModel:ResponseModel?
    var duplModel:ResponseModel?
    var logoModel:LogoModel?
    
    func getDetails(){
        NetworkManager.shared.request(url: URLs.detailsAPI, type: ResponseModel.self) { response in
            self.responseModel = response
            self.duplModel = response
            var arry = self.responseModel?.data?.map{String($0.id ?? 0)}.compactMap{$0}
            arrrr = arry
            self.ids = self.responseModel?.data?.map{String($0.id ?? 0)}.compactMap{$0}.joined(separator: ",")

            self.bind()
        }
    }
    
    func getLogo(_ ids:String){
        NetworkManager.shared.request(url: String(format: URLs.logoAPI, ids) , type: LogoModel.self ) { resp in
            self.logoModel = resp
            self.bindToView()
        }
    }
}
