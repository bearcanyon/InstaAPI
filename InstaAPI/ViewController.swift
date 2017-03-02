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
    
    var urlString = ""
    var param = ["client_id": ""]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = ProcessInfo.processInfo.environment
        if let value = env["urlString"] {
            urlString = value
        }
        if let value = env["client_id"] {
            param["client_id"] = value
        }
        
        var items: [JSON] = []
        Alamofire.request(urlString, method: .get, parameters: param).responseJSON { response in//parametersはnilでも取れるなんで？
            let json = JSON(response.result.value as Any)
            json.forEach({ (_, data) in
                items.append(data)
            })

            let item = items[0]
            var datas: [JSON] = []
            item.forEach({ (_, data) in
                datas.append(data)
            })
            var count = 0
            for data in datas {
                let urlString = data["images"]["standard_resolution"]["url"].string
                let url = NSURL(string: urlString!)
                let imageData = try! Data(contentsOf: url as! URL)
                let image = UIImage(data: imageData)
                let imageView = UIImageView(image: image)
                imageView.frame = CGRect(x: 0, y: count * 100 + 20, width: 100, height: 100)
                self.view.addSubview(imageView)
                let dateUnix: TimeInterval = TimeInterval(data["created_time"].intValue)
                let date = Date(timeIntervalSince1970: dateUnix)
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let dateString = formatter.string(from: date)
                let timeLabel = UILabel()
                timeLabel.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: 15)
                timeLabel.text = dateString
                timeLabel.font = UIFont.systemFont(ofSize: 8)
                timeLabel.textColor = UIColor.white
                timeLabel.textAlignment = .center
                imageView.addSubview(timeLabel)
                timeLabel.sizeToFit()
                count += 1
            }
        }
    }
}






//    func getImageToJSON(data: [String: Any]) {
//        for (string, any) in data {
//            print(string)
//            print(any)
//        }
//    }

//init(path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
//    url = path
//    self.method = method
//    self.parameters = parameters
//}
//
//func request(success: @escaping (_ data: Dictionary<String, Any>)-> Void, fail: @escaping (_ error: Error?)-> Void) {
//    Alamofire.request(url, method: method, parameters: parameters).responseJSON { response in
//        if response.result.isSuccess {
//            success(response.result.value as! Dictionary)
//        }else{
//            fail(response.result.error)
//        }
//    }
//}
//}




//このアプリってもう認証しちゃってるから認証してなかったらする処理も付け加えないと行けないし、
//認証した後返って来たaccess_tokenでアクセスするわけだからその記述もしないといけない。


//返って来たアクセストークン
//https://www.facebook.com/naokikumagai0405#access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26

//AlamofireとSwiftyJSONを使用する
//   https://instagram.com/oauth/authorize/?client_id=0c301ed49ab945bcb9bc0011f1c1cd3a&redirect_uri=https://www.facebook.com/naokikumagai0405&response_type=token

//https://api.instagram.com/v1/users/self/media/recent?access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26
