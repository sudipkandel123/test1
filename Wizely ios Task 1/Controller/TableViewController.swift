//
//  TableViewController.swift
//  Wizely ios Task 1
//
//  Created by Sudip on 12/5/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable {
    let url:String
    let labels_url:String
//    let alpha2Code:String
//    let alpha3Code:String
//    let region:String
//    let subregion:String
    
}

class TableViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var tableViewCell: UITableView!
    var arrdata = [jsonstruct]()
    var orgStr = String()
    var repoStr = String()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCell.delegate = self
        tableViewCell.dataSource = self

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.arrdata.count
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:gitTV = tableView.dequeueReusableCell(withIdentifier: "cell") as! gitTV
        cell.issue.text = "Name : \(arrdata[indexPath.row].url)"
        cell.issueTitle.text = "Capital : \(arrdata[indexPath.row].labels_url)"
        return cell
    }
    
}
    
    
    func jsonParserOpen(){
        //        let gitJsonString = "https://api.github.com/\(orgName)/\(reponame)"
        
        let jsonGit = "http://api.github.com/repos/Alamofire/Alamofire/issues?state=open"
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
                    print(git)
//                    self.userNameTextField.text = git.name////
//                    self.descTextView.text = git.description////
                    // self.userImage.image =
                    //self.userNameTextField.text = git.node_id
//                    self.tableViewCell.reloadData()
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
    
