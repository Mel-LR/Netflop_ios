//
//  SearchTableViewController.swift
//  Ios_Project
//
//  Created by Mélyne LERAY on 08/11/2022.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate{

    
    @IBOutlet weak var searchBar: UISearchBar!
    
        var movieList:[Movie] = []
        var filteredSearch: [Movie]!
        
        override func viewDidLoad() {
            super.viewDidLoad()

            searchBar.delegate = self
            
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
                    
            let url = URL(string: "http://localhost:3001/data")!
                    
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                        if let data = json as? [[String: Any]] {
                            for movieData in data {
                                let movie = Movie(json: movieData)
                                self.movieList.append(movie!)
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            task.resume()
            filteredSearch = movieList
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return filteredSearch.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableIdentifer")! as UITableViewCell
            
            cell.textLabel?.text = filteredSearch[indexPath.row].title
            cell.textLabel?.textColor = UIColor.white
            
    //        print("section : \(indexPath.section) - row : \(indexPath.row)")
    //
    //        if indexPath.row % 2 == 0 {
    //            cell.backgroundColor = UIColor.purple
    //        } else {
    //            cell.backgroundColor = UIColor.blue
    //        }

            return cell
        }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "film") as? FilmViewController {
                
                vc.movie = self.filteredSearch[indexPath.row]
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        // MARK: Search Bar Config

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            filteredSearch = []
            
            if searchText == "" {
                filteredSearch = []
            }
            else {
                for movie in movieList {
                    if movie.title.lowercased().contains(searchText.lowercased()) {
                        filteredSearch.append(movie)
                    }
                }
            }
            self.tableView.reloadData()
        }
    }
