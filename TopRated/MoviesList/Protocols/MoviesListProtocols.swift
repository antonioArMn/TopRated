//
//  MoviesListProtocols.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesListViewProtocol: class {
  var presenter: MoviesListPresenterProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> VIEW
  */
  func reloadTable()
}

protocol MoviesListWireFrameProtocol: class {
  static func presentMoviesListModule() -> UIViewController
  /**
  * Add here your methods for communication PRESENTER -> WIREFRAME
  */
}

protocol MoviesListPresenterProtocol: class {
  var view: MoviesListViewProtocol? { get set }
  var interactor: MoviesListInteractorInputProtocol? { get set }
  var wireFrame: MoviesListWireFrameProtocol? { get set }
  /**
  * Add here your methods for communication VIEW -> PRESENTER
  */
  func viewDidLoad()
}

protocol MoviesListInteractorOutputProtocol: class {
  /**
  * Add here your methods for communication INTERACTOR -> PRESENTER
  */
  func didFetchTopRatedMovies()
}

protocol MoviesListInteractorInputProtocol: class
{
  var presenter: MoviesListInteractorOutputProtocol? { get set }
  var APIDataManager: MoviesListAPIDataManagerInputProtocol? { get set }
  var localDatamanager: MoviesListLocalDataManagerInputProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> INTERACTOR
  */
  func fetchTopRatedMovies()
}

protocol MoviesListDataManagerInputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> DATAMANAGER
  */
}

protocol MoviesListAPIDataManagerInputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
  */
  func retriveTopRatedMovies(completion: @escaping ([Movie], Error?) -> Void)
}

protocol MoviesListLocalDataManagerInputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
  */
}
