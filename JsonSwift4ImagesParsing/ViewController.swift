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
    var myArr = [String]()
    
    var names: [String] = []
    var email: [String] = []
    
    
    struct ContactnInfo {
        var name : String = ""
        var mail : String = ""
        
        init?(dict:[String:Any]){
            guard
                let name = dict["name"] as? String,
                let mail = dict["email"] as? String
                
            else{return nil}
            self.name = name
            self.mail = mail
    
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        jsonParsing()
        jsonParsingSecond()
    }
    
    func jsonParsingSecond(){
        let url=URL(string:"http://api.androidhive.info/contacts/")
        do {
            let allContactsData = try Data(contentsOf: url!)
            if let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : Any] {
                let arrJSON = allContacts["contacts"] as! [Any]
                
                let aObj = arrJSON[0] as! [String:Any]
                let EmplInfo = ContactnInfo(dict: aObj)
                print(EmplInfo?.name)
                print(EmplInfo?.mail)
            }
            
            
        }
        catch {
            
        }
    }

//        guard let urlStr = URL(string: "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json") else {return}

}

