//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Fatma Fitouri on 17/5/2022.
//

import UIKit
import Hero

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var starsContainer: UIView!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var starsIcons: [UIImageView]!

    func setCell(movie: Movie) {
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
        movieImage.sd_setImage(with: URL(string: movie.posterPath))
        averageLabel.text = "\(movie.voteAverage)"
        let filled = UIImage(named: "ic_star_full")
        let empty = UIImage(named: "ic_star_empty")
        for star in starsIcons {
            star.image = star.tag <= Int(movie.voteAverage) ? filled : empty
        }
        if movie.voteAverage == 0 {
            averageLabel.isHidden = true
            starsContainer.isHidden = true
        }
        movieImage.heroID = "image\(movie.movieID)"
        containerView.heroID = "container\(movie.movieID)"
        titleLabel.heroID = "title\(movie.movieID)"
    }
}
