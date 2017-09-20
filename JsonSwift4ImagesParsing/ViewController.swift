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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.adorable.io/avatars/list")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error2) in
            
            if(error2 != nil){
                print("Have an Error")
            }else{
                if let myData = data{
                    do{
                        let myJson = try JSONSerialization.jsonObject(with: myData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                        print(myJson)
                        if let face = myJson["face"] as AnyObject?{
//                            print(face ?? "")
                            if let mouth = face["mouth"] as! NSArray?{
                                print(mouth[0])
                               
                            }
                            
                        }
                        
                        
                        
                        
                    }catch{
                        print("Catching Error")
                    }
                }
            }
            
        }.resume()
        
        
    }

}

