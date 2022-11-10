//
//  GenresTableViewController.swift
//  Ios_Project
//
//  Created by Mélyne LERAY on 08/11/2022.
//

import UIKit

class GenresTableViewCell: UITableViewCell{
    @IBOutlet weak var genresImageView: UIImageView!
    @IBOutlet weak var genresGenreLabel: UILabel!
    @IBOutlet weak var genresTitleLabel: UILabel!
}

class GenresTableViewController: UITableViewController {
    
    var selectedGenre = ""
    var sortedMoviesByGenre:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
                
        let url = URL(string: "http://localhost:3001/data/genre/"+selectedGenre)!
        
                
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [[String: Any]] {
                        for movieData in data {
                            let movie = Movie(json: movieData)
                            self.sortedMoviesByGenre.append(movie!)
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sortedMoviesByGenre.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genresTableIdentifier", for: indexPath) as! GenresTableViewCell

        // Configure the cell...
        cell.genresTitleLabel?.text = self.sortedMoviesByGenre[indexPath.row].title
        cell.genresGenreLabel?.text = self.sortedMoviesByGenre[indexPath.row].genre
        cell.genresImageView?.image = UIImage(data: try! Data(contentsOf: URL(string: self.sortedMoviesByGenre[indexPath.row].image)!))
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(named: "kRed")
        } else {
            cell.backgroundColor = UIColor(named: "kGrey")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "film") as? FilmViewController {
            
            vc.movie = self.sortedMoviesByGenre[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
