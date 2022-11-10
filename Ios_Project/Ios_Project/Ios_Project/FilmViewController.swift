//
//  FilmViewController.swift
//  Ios_Project
//
//  Created by Yanis on 28/04/2022.
//

import UIKit
import AVKit

class FilmViewController: UIViewController {

    var movie:Movie?
    var rating:String = ""
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieStudioLabel: UILabel!
    @IBOutlet weak var movieReleaseLabel: UILabel!
    @IBAction func movieTrailerActionButton(_ sender: UIButton) {
        if let url = URL(string: "https://file-examples.com/storage/fe8c7eef0c6364f6c9504cc/2017/04/file_example_MP4_480_1_5MG.mp4") {
                    let player = AVPlayer(url: url)

                        // Create a new AVPlayerViewController and pass it a reference to the player.
                        let controller = AVPlayerViewController()
                        controller.player = player

                        // Modally present the player and call the player's play() method when complete.
                        present(controller, animated: true) {
                            player.play()
                            
                            }
                        }
    }
    @IBAction func movieAllocineActionButton(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "webview") as? WebviewViewController {
            vc.movieTitle = movie!.title
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.movieImageView.image = image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage(from: movie!.image)
        
        for _ in 1...movie!.rate{
            rating += "⭐️"
        }
        movieTitleLabel.text = movie?.title
        movieGenresLabel.text = movie!.genre + " - " + rating + " - " + movie!.duration
        movieDescriptionLabel.text = movie?.description
        movieStudioLabel.text = "Studio: " + movie!.studio
        movieReleaseLabel.text = "Release date: " + movie!.release
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
