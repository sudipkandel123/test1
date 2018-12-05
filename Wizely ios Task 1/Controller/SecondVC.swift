//
//  ViewController.swift
//  Wizely ios Task 1
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit
struct gitAPI : Decodable{
    let node_id : String?
    let id : Int?
    let description : String?
    let userImage : String?
}

class SecondVC: UIViewController {
    //MARK : To keep this inside a model and produce initializer
    var orgString = String()
    var repoString = String()
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var descTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   jsonParse()
        
    }
    
    
    
   // MARK: To fetch the api
    func jsonParse(){
        //        let gitJsonString = "https://api.github.com/\(orgName)/\(reponame)"
        
        let jsonGit = "http://api.github.com/repos/\(orgString)/\(repoString)"
        guard let url = URL(string: jsonGit)
            else{
                return
                
        }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //
            guard let data = data else{ return }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let git = try decoder.decode(gitAPI.self, from: data)
//               for gits in git
//               {
                self.userNameTextField.text = git.node_id
//                }
                
                
            }
            catch let jsonErr{
                print("Error serializing json\(jsonErr)")
            }
            let dataToString = String(data: data, encoding: .utf8)
            
            }.resume()
        
    }
    
    @IBAction func openIssueButton(_ sender: Any) {
        performSegue(withIdentifier: "goToTableView", sender: self)
    }
    
    @IBAction func closedIssueButton(_ sender: Any) {
        performSegue(withIdentifier: "goToTableView", sender: self)
    }
   
}
