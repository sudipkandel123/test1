//
//  ViewController.swift
//  Wizely ios Task 1
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit
struct gitAPI{
    let userName : String
    let description : String
    let userImage : String
}
class SecondVC: UIViewController {
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var descTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gitJsonString = "https://api.github.com/\(orgName)/\(reponame)"
        
        let jsonGit = "http://api.github.com/repos/Alamofire/Alamofire"
       guard let url = URL(string: jsonGit)
        else{
       return
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //
            guard let data = data else{ return }
            let dataToString = String(data: data, encoding: .utf8)
            print(dataToString)
        }.resume()
        
        
    }
    
}
