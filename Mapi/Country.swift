//
//  Country.swift
//  Mapi
//
//  Created by Mavi on 16/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation
import Alamofire

class Country {
    
    private var _name: String
    private var _alphaCode: String
    private var _capital: String!
    
    //Getters
    var name: String {
        return _name
    }
    
    var alphaCode: String {
        return _alphaCode
    }
    
    var capital: String {
        get {
            if _capital == nil {
                return ""
            }
            return _capital
        }
        set {
            _capital = newValue
        }
    }
    
    init(name: String, alphaCode: String) {
        self._name = name
        self._alphaCode = alphaCode
    }
    
    func downloadCountryDetails(completed: @escaping DownloadComplete) {
        
        Alamofire.request("\(BASE_URL)\(self.alphaCode)").responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, Any> {
                
                if let jsonCapital = json["capital"] as? String {
                    self.capital = jsonCapital
                    completed()
                }
            }
        }
    }
}
