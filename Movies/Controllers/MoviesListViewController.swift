//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Fatma Fitouri on 17/5/2022.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var list = [Movie]()
    var isLoading = false
    var canLoadMore = true

    override func viewDidLoad() {
        super.viewDidLoad()

        getMoviesList()
    }

    func getMoviesList() {
        guard !isLoading && canLoadMore else {return}
        isLoading = true
        MovieServices.instance.getListOfMovies(for: list.count/20 + 1) { list in
            self.canLoadMore = list.count == 20
            self.list.append(contentsOf: list)
            self.list = self.list.uniqueItems(includeElement: {$0.movieID == $1.movieID})
            self.tableView.reloadData()
            self.isLoading = false
        }
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieTableViewCell
        cell?.setCell(movie: list[indexPath.row])
        return cell!
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == list.count - 1 {
            getMoviesList()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as? MovieDetailsViewController
        detailsVC?.movie = list[indexPath.row]
        self.present(detailsVC!, animated: true)
    }
}
