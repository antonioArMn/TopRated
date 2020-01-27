//
//  MoviesListInteractor.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation

class MoviesListInteractor: MoviesListInteractorInputProtocol {
  
  weak var presenter: MoviesListInteractorOutputProtocol?
  var APIDataManager: MoviesListAPIDataManagerInputProtocol?
  var localDatamanager: MoviesListLocalDataManagerInputProtocol?

  init() {}
  
  func fetchTopRatedMovies() {
    APIDataManager?.retriveTopRatedMovies(completion: { (movies, error) in
      print(movies)
    })
  }
}
