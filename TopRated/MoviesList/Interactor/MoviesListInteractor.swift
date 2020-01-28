//
//  MoviesListInteractor.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MoviesListInteractor: MoviesListInteractorInputProtocol {
  
  weak var presenter: MoviesListInteractorOutputProtocol?
  var APIDataManager: MoviesListAPIDataManagerInputProtocol?
  var localDatamanager: MoviesListLocalDataManagerInputProtocol?

  init() {}
  
   private func fetchTopRatedMovies() {
    APIDataManager?.retriveTopRatedMovies(completion: { (movies, error) in
      if let message = error {
        print(message)
      }
      let topten = movies[..<10]
      let newArray = Array(topten)
      self.presenter?.didFetchTopRatedMovies(movies: newArray)
    })
  }
  
  func saveMovies(movies: [Movie]) {
    localDatamanager?.saveMoviesInDB(movies: movies)
  }
  
  private func retrieveMovies() {
    let movies = localDatamanager?.retriveMoviesFromDB()
    presenter?.showMovies(movies: movies ?? [])
  }
  
  func deleteMovies() {
    localDatamanager?.deleteMoviesFromDB()
  }
  
  func saveCurrentDate() {
    let date = Date()
    UserDefaults.standard.set(date, forKey: "dateKey")
  }
  
  func validateDate() {
    if let savedDate = UserDefaults.standard.object(forKey: "dateKey") as? Date {
      if Date().timeIntervalSince(savedDate) > 86400 {
        print("By service")
        self.fetchTopRatedMovies()
      } else {
        print("By local")
        self.retrieveMovies()
      }
    } else {
      print("By service")
      self.fetchTopRatedMovies()
    }
  }
}
