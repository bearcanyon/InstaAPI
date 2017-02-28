//
//  ApiManager.swift
//  InstaAPI
//
//  Created by KumagaiNaoki on 2017/02/28.
//  Copyright © 2017年 KumagaiNaoki. All rights reserved.
//

import Foundation
import Alamofire


struct ApiManager {
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    init(path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        url = path
        self.method = method
        self.parameters = parameters
    }
    
    func request(success: @escaping (_ data: Dictionary<String, Any>)-> Void, fail: @escaping (_ error: Error?)-> Void) {
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                success(response.result.value as! Dictionary)
            }else{
                fail(response.result.error)
            }
        }
    }
}
