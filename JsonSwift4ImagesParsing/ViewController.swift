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
        
        var tempArr = [String]()
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error2) in
            
            if(error2 != nil){
                print("Have an Error")
            }else{
                if let myData = data{
                    do{
                        let myJson = try JSONSerialization.jsonObject(with: myData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let myArr = myJson as? NSArray{
                            for i in myArr {
                                print("\nElement is:\n")
                                if let myDict = i as? NSDictionary {
//                                    print(myDict.value(forKey: "name")!)
                                    tempArr.append(myDict.value(forKey: "name") as! String)
                                    
                                    
                                }
                                
                            }
                            print("tempArr is \n",tempArr)
                        }
                        
                    }catch{
                        print("Catching Error")
                    }
                }
            }
            
        }.resume()
        
        
    }

}

