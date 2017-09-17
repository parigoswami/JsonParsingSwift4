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
    var name : String = ""
    
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
                
                for index in 0...arrJSON.count-1{
                    let aObject = arrJSON[index] as! [String : Any]
                      name = aObject["name"] as! String
                    print("\(index) Name is \(name)")
//                    names.append(aObject["name"] as! String)
//                    email.append(aObject["email"] as! String)
//                    print("\nName is ",names)
//                    print("\nEmail is ",email,"\n")
                }
            }
            
            
        }
        catch {
            
        }
    }

//        guard let urlStr = URL(string: "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json") else {return}

}

