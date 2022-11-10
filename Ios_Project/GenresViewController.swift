//
//  GenresViewController.swift
//  Ios_Project
//
//  Created by Mélyne LERAY on 27/04/2022.
//

import UIKit

class GenresViewController: UIViewController {

    @IBAction func genresAction(_ sender: UIButton) {
        if let titleLabel = sender.titleLabel {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "genresTable") as? GenresTableViewController {
                vc.selectedGenre = titleLabel.text!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
