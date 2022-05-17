//
//  Movie.swift
//  Movies
//
//  Created by Fatma Fitouri on 16/5/2022.
//

import Foundation
import SwiftyJSON

struct Movie {
    var movieID = String()
    var posterPath = String()
    var title = String()
    var overview = String()
    var voteAverage: Double = 0.0
    var voteCount: Int = 0
    var releaseDate = String()
    var genres = [String]()

    init(json: JSON) {
        self.movieID = "\(json["id"].int ?? 0)"
        self.posterPath = "https://image.tmdb.org/t/p/w500/" + (json["poster_path"].string ?? "")
        self.title = json["title"].string ?? ""
        self.overview = json["overview"].string ?? ""
        self.releaseDate = json["release_date"].string ?? ""
        self.voteCount = json["vote_count"].int ?? 0
        self.voteAverage = json["vote_average"].double ?? 0.0
        self.genres = json["genres"].array?.map({$0["name"].string ?? ""}) ?? []
    }
}
