//
//  MoviesListViewController.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

class MoviesListViewController: UIViewController, MoviesListViewProtocol {
  
  var presenter: MoviesListPresenterProtocol?
  var movies: [Movie] = []
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    presenter?.viewDidLoad()
  }
  
  func reloadTable(with movies: [Movie]) {
    self.movies = movies
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
    
    let movie = movies[indexPath.row]
    cell.titleLabel.text = movie.title
    cell.releaseDate.text = movie.releaseDate
    
    if let posterPath = movie.posterPath {
      MoviesListAPIDataManager.downloadPosterImage(posterPath: posterPath) { (data, error) in
        guard let data = data else { return }
        let image = UIImage(data: data)
        cell.posterImageView.image = image
      }
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter?.showMovieDetail(forMovie: movies[indexPath.row])
  }
}
