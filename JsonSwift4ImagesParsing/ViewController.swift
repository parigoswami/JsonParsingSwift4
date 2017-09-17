//
//  ViewController.swift
//  JsonSwift4ImagesParsing
//
//  Created by pari on 16/09/17.
//  Copyright © 2017 pari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView : UITextView!
    var myArr = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        jsonParsing()
        jsonParsingSecond()
    }
    
    func jsonParsingSecond(){
        let myUrl = URL.init(string: "https://api.androidhive.info/contacts/")
        URLSession.shared.dataTask(with: myUrl!) { (data, response, error1) in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
//                print("Dict is ",jsonObj?.value(forKey: "contacts") as Any)
                self.myArr = jsonObj?.value(forKey: "contacts") as! [Any]
                print("\n Myarr[0] is \n",self.myArr[0])
//              print(self.myArr[value(forKey: "address")] as? String)
                
                

            }
            
        }.resume()
    }
    
//    func jsonParsing(){
//        guard let urlStr = URL(string: "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json") else {return}
//        URLSession.shared.dataTask(with: urlStr) { (data, response, error1) in
//            if((error1) != nil){
//                print("Having an error")
//                return
//            }
//            do{
//                guard let jsonSel = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [Any] else {return}
//                print("My Json obj is ",jsonSel)
//                self.myTextView.text = jsonSel as? String
//
//            }catch let myException {
//                print("Exceptions Are: \n ",myException)
//            }
//        }
//
//    }

}

