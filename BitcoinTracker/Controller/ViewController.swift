//
//  ViewController.swift
//  BitcoinTracker
//
//  Created by muhammad huzaifa on 9/15/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    let username = "huzaifa"
    let pas = "123"
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self
        password.delegate = self
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if userName.text == username && password.text == pas{
            performSegue(withIdentifier: "id", sender: Any?.self)
            
        }
        return true
    }
}

