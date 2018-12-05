//  ViewController.swift
//  Wizely ios Task 1
//
//  Created by Sudip on 12/4/18.1
//  Copyright © 2018 Sudeepasa. All rights reserved.
//

import UIKit


class FirstVC: UIViewController {

    @IBOutlet weak var orgName: UITextField!
    @IBOutlet weak var repoName: UITextField!
   
    //take the orgName and repoName and parse it to the json
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK : Remember to optional bind
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondView = segue.destination as! SecondVC
        secondView.orgString = orgName.text! //remember to optional bind both
        secondView.repoString = repoName.text!
        
    }

    @IBAction func submitButton(_ sender: Any) {
        performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
}

