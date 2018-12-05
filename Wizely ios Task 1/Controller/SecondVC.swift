//
//  ViewController.swift
//  Wizely ios Task 1
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
// learn multithreading

import UIKit
struct gitAPI : Decodable{
    let name : String?
    let id : Int?
    let description : String?
    let avatar_url : String?
}

class SecondVC: UIViewController {
    //MARK : To keep this inside a model and produce initializer
    var orgString = String()
    var repoString = String()
//    let orgN : String = orgString
    
    
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
                
        }//self.WebserviceCall(url)
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("failed to get data from url",err)
                    return
                }
            }
            //
            guard let data = data else{ return }
            do{
                let decoder = JSONDecoder()
                //the below line was causing error
decoder.keyDecodingStrategy = .useDefaultKeys
                let git = try decoder.decode(gitAPI.self, from: data)
                print(git)
                DispatchQueue.main.async {
                    self.userNameTextField.text = git.name
                    self.descTextView.text = git.description
                   // self.userImage.image =
                    //self.userNameTextField.text = git.node_id
                }
//               for gits in git
//               {
//                self.userNameTextField.text = git.node_id
//                }
                }
            catch let jsonErr{
                print("Error serializing json\(jsonErr)")
            }
           // let dataToString = String(data: data, encoding: .utf8)
            
            }.resume()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        let tablev = segue.destination as! TableViewController
        tablev.orgStr = orgString //remember to optional bind both
        tablev.repoStr = repoString
    }
    @IBAction func openIssueButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToTableView", sender: self)
        
    }
    
    @IBAction func closedIssueButton(_ sender: Any) {
        performSegue(withIdentifier: "goToTableView", sender: self)
    }
   
}
