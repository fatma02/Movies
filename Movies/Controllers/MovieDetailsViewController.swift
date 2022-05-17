//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Fatma Fitouri on 17/5/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var gendersLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var starsContainer: UIView!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet var starsIcons: [UIImageView]!

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        setMovieDetails()
        movieImage.heroID = "image\(movie?.movieID ?? "")"
        containerView.heroID = "container\(movie?.movieID ?? "")"
        titleLabel.heroID = "title\(movie?.movieID ?? "")"
        getDetails()
    }

    func getDetails() {
        guard let id = movie?.movieID else {return}
        MovieServices.instance.getMovieDetails(by: id) { movie in
            self.movie = movie
            self.setMovieDetails()
        }
    }

    func setMovieDetails() {
        guard let movie = movie else {
            return
        }
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview
        movieImage.sd_setImage(with: URL(string: movie.posterPath))
        averageLabel.text = "\(movie.voteAverage)"
        gendersLabel.text = movie.genres.joined(separator: ", ")
        let filled = UIImage(named: "ic_star_full")
        let empty = UIImage(named: "ic_star_empty")
        for star in starsIcons {
            star.image = star.tag <= Int(movie.voteAverage) ? filled : empty
        }
        if movie.voteAverage == 0 {
            averageLabel.isHidden = true
            starsContainer.isHidden = true
        }
    }

    @IBAction func backButtonDidClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
