//
//  MovieDetailView.swift
//  TopTenMovies
//
//  Created by José Antonio Arellano Mendoza on 01/27/2020.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overViewLabel: UITextView!
  
  var presenter: MovieDetailPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  func setupView(with movie: Movie) {
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.title = "Detalles"
    self.titleLabel.text = movie.title
    self.releaseDateLabel.text = movie.releaseDate
    self.overViewLabel.text = movie.overview
    if let posterPath = movie.posterPath {
      MoviesListAPIDataManager.downloadPosterImage(posterPath: posterPath) { (data, error) in
        guard let data = data else { return }
        let image = UIImage(data: data)
        self.imageView.image = image
      }
    }
  }
}
