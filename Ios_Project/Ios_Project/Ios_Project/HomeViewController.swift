//
//  HomeViewController.swift
//  Ios_Project
//
//  Created by Mélyne LERAY on 26/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBAction func filmsAction(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "films") as? FilmsTableViewController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func genresAction(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "genres") as? GenresViewController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func settingsAction(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "settings") as? SettingsViewController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Netflop"
        
        let item1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem =    item1
        // Do any additional setup after loading the view.
        
        
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
