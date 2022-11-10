//
//  WebviewViewController.swift
//  Ios_Project
//
//  Created by Yanis on 28/04/2022.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var movieTitle:String = ""

    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.reloadWebView(movieTitle: movieTitle)
    }
    
    
    func reloadWebView(movieTitle: String){
        
        let url = buildUrl(movieTitle: movieTitle)
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
    
    func buildUrl(movieTitle: String) -> URL{
        let scheme = "https"
        let host = "www.allocine.fr"
        let path = "/rechercher"
        let queryItem = URLQueryItem(name: "q", value: movieTitle)


        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = [queryItem]

        return urlComponents.url!
    }
}
