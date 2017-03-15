//
//  ViewController.swift
//  InstaAPI
//
//  Created by KumagaiNaoki on 2017/02/27.
//  Copyright © 2017年 KumagaiNaoki. All rights reserved.
//


//        https://api.instagram.com/oauth/authorize/?client_id=0c301ed49ab945bcb9bc0011f1c1cd3a&redirect_uri=https://www.facebook.com/naokikumagai0405&response_type=token


//            https://www.facebook.com/naokikumagai0405#access_token=





///////sdfsafsasafs
///rename
///fasfaf


import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIWebViewDelegate {
    
    var urlString = ""
    var param = [String: Any]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = ProcessInfo.processInfo.environment
        if let value = env["urlString"] {
            urlString = value
        }
        if let value = env["client_id"] {
            param["client_id"] = value
            param["client_secret"] = "9f52de559d3a464bb01901de0251695f"
            param["grant_type"] = "authorization_code"
            param["redirect_url"] = URL(string: "https://www.facebook.com/naokikumagai0405")
            param["code"] = "6375c89b3c334173a7931f019ab973d1"
        }
        
//        let url = URL(string: "https://instagram.com/oauth/authorize/?response_type=token&client_id=0c301ed49ab945bcb9bc0011f1c1cd3a&redirect_uri=https://www.facebook.com/naokikumagai0405")
        let url = URL(string: "https://api.instagram.com/oauth/access_token")
        //これをサファリで開いてコールバックさせて引数にアドレスを持たせる？？UIWebViewでも良いけど
        Alamofire.request(url!, method: .post, parameters: param).responseJSON { response in
            
            let json = JSON(response.result.value as Any)
            print(json)

        }
        
        
//        var items: [JSON] = []
//        Alamofire.request(urlString, method: .get, parameters: param).responseJSON { response in//parametersはnilでも取れるなんで？
//            print(response)
//            let json = JSON(response.result.value as Any)
//            print(json)
//            json.forEach({ (_, data) in
//                items.append(data)
//            })
//
//            let item = items[0]
//            var datas: [JSON] = []
//            item.forEach({ (_, data) in
//                datas.append(data)
//            })
//            var count = 0
//            for data in datas {
//                let urlString = data["images"]["standard_resolution"]["url"].string
//                let url = NSURL(string: urlString!)
//                print(urlString)
//                let imageData = try! Data(contentsOf: url as! URL)
//                let image = UIImage(data: imageData)
//                let imageView = UIImageView(image: image)
//                imageView.frame = CGRect(x: 0, y: count * 100 + 20, width: 100, height: 100)
//                self.view.addSubview(imageView)
//                let dateUnix: TimeInterval = TimeInterval(data["created_time"].intValue)
//                let date = Date(timeIntervalSince1970: dateUnix)
//                let formatter = DateFormatter()
//                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//                let dateString = formatter.string(from: date)
//                let timeLabel = UILabel()
//                timeLabel.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: 15)
//                timeLabel.text = dateString
//                timeLabel.font = UIFont.systemFont(ofSize: 8)
//                timeLabel.textColor = UIColor.white
//                timeLabel.textAlignment = .center
//                imageView.addSubview(timeLabel)
//                timeLabel.sizeToFit()
//                count += 1
//            }
//        }
    }








//エンドポイント？？

//https://scontent.cdninstagram.com/t51.2885-15/e15/11351945_710301525747053_1784809375_n.jpg
//https://scontent.cdninstagram.com/t51.2885-15/e15/11195866_1427464310903423_399668607_n.jpg



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


//      https://www.facebook.com/naokikumagai0405

//このアプリってもう認証しちゃってるから認証してなかったらする処理も付け加えないと行けないし、
//認証した後返って来たaccess_tokenでアクセスするわけだからその記述もしないといけない。


//返って来たアクセストークン
//https://www.facebook.com/naokikumagai0405#access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26

//AlamofireとSwiftyJSONを使用する
//   https://instagram.com/oauth/authorize/?client_id=0c301ed49ab945bcb9bc0011f1c1cd3a&redirect_uri=https://www.facebook.com/naokikumagai0405&response_type=token

//https://api.instagram.com/v1/users/self/media/recent?access_token=30724986.0c301ed.31740b81f98f43f6a6c4217bb7182a26
}
