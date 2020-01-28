//
//  MoviesListPresenter.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol, MoviesListInteractorOutputProtocol {
  
  weak var view: MoviesListViewProtocol?
  var interactor: MoviesListInteractorInputProtocol?
  var wireFrame: MoviesListWireFrameProtocol?

  init() {}
  
  func viewDidLoad() {
    interactor?.validateDate()
  }
  
  func didFetchTopRatedMovies(movies: [Movie]) {
    interactor?.saveCurrentDate()
    interactor?.deleteMovies()
    interactor?.saveMovies(movies: movies)
    view?.reloadTable(with: movies)
  }
  
  func showMovieDetail(forMovie movie: Movie) {
    wireFrame?.presentMovieDetailScreen(from: view!, forMovie: movie)
  }
  
  func showMovies(movies: [Movie]) {
    view?.reloadTable(with: movies)
  }
}
