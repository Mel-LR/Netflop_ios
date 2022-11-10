//
//  ViewController.swift
//  Ios_Project
//
//  Created by Kévin DOBROTA on 08/11/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    
    @IBAction func connectButton(_ sender: Any) {
        if nameTextField.text == "Andy" && passwordTextField.text == "Andy" {
            print("OK ok")
            
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "home") as? HomeViewController {
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            print("non")
        }
    }
}

