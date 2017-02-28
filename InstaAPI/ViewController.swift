//
//  ViewController.swift
//  InstaAPI
//
//  Created by KumagaiNaoki on 2017/02/27.
//  Copyright © 2017年 KumagaiNaoki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var mediaList = [String : Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.instagram.com/v1/users/self/media/recent?access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26"
        let param = ["client_id": "0c301ed49ab945bcb9bc0011f1c1cd3a"]
        let apiManager = ApiManager(path: urlString, method: .get, parameters: param)
        apiManager.request(success: { (data: Dictionary) in
            self.getImageToJSON(data: data)
        }) { (error: Error?) in
            print(error)
        }
    }
    
    func getImageToJSON(data: [String: Any]) {
        print(data["data"])
        
        
    
        
        for (string, any) in data {
            print(string)
            print(any)
//            if string == "meta" {
//                data["code"]
//            }
        }
    }
}

//このアプリってもう認証しちゃってるから認証してなかったらする処理も付け加えないと行けないし、
//認証した後返って来たaccess_tokenでアクセスするわけだからその記述もしないといけない。


//返って来たアクセストークン
//https://www.facebook.com/naokikumagai0405#access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26

//AlamofireとSwiftyJSONを使用する
//   https://instagram.com/oauth/authorize/?client_id=0c301ed49ab945bcb9bc0011f1c1cd3a&redirect_uri=https://www.facebook.com/naokikumagai0405&response_type=token

//https://api.instagram.com/v1/users/self/media/recent?access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26
