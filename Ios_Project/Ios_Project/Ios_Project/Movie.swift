//
//  Movie.swift
//  Ios_Project
//
//  Created by Jade BOUIGES on 08/11/2022.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let genre: String
    let release: String
    let duration: String
    let description: String
    let studio: String
    let image: String
    let rate: Int
}

extension Movie {
    init?(json: [String: Any]) {
        guard
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let genre = json["genre"] as? String,
            let release = json["release"] as? String,
            let duration = json["duration"] as? String,
            let description = json["description"] as? String,
            let studio = json["studio"] as? String,
            let image = json["image"] as? String,
            let rate = json["rate"] as? Int
          
        else {
            return nil
        }

        self.id = id
        self.title = title
        self.genre = genre
        self.release = release
        self.duration = duration
        self.description = description
        self.studio = studio
        self.image = image
        self.rate = rate
    }
}
