//
//  MovieServices.swift
//  Movies
//
//  Created by Fatma Fitouri on 16/5/2022.
//

import Alamofire
import Foundation
import SwiftyJSON

class MovieServices {
    static var instance = MovieServices()

    func getListOfMovies(for page: Int, completion: @escaping (_ list: [Movie]) -> Void) {
        DataManager.instance.sendAPIRequest(path: String(format: APIs.getListOfMovies, page, Locale.preferredLanguages.first ?? Locale.current.identifier), method: .get) { json, _ in
            completion(json?["results"].array?.map({Movie(json: $0)}) ?? [])
        }
    }

    func getMovieDetails(by id: String, completion: @escaping (_ movie: Movie) -> Void) {
        DataManager.instance.sendAPIRequest(path: String(format: APIs.getMovieDetails, id, Locale.preferredLanguages.first ?? Locale.current.identifier), method: .get) { json, _ in
            completion(Movie(json: json ?? JSON()))
        }
    }
}
