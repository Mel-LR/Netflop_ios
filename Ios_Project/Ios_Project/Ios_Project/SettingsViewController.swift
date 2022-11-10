//
//  SettingsViewController.swift
//  Ios_Project
//
//  Created by admin on 28/04/2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        if #available(iOS 15.0, *) {
             let appDelegate = UIApplication.shared.windows.first
                 if sender.isOn {
                     appDelegate?.overrideUserInterfaceStyle = .dark
                      return
                 }
             appDelegate?.overrideUserInterfaceStyle = .light
             return
        }
    }
    @IBOutlet weak var UISwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIApplication.shared.windows.first?.overrideUserInterfaceStyle == .dark) {
            UISwitch.isOn = true
        }
        self.title = "Paramètres"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "login") as? LoginViewController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
