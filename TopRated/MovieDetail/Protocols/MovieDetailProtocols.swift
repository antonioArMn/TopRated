//
//  MovieDetailProtocols.swift
//  TopTenMovies
//
//  Created by José Antonio Arellano Mendoza on 01/27/2020.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailViewProtocol: class {
  var presenter: MovieDetailPresenterProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> VIEW
  */
  func setupView(with movie: Movie)
}

protocol MovieDetailWireFrameProtocol: class {
    static func createMovieDetailModule(for movie: Movie) -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol MovieDetailPresenterProtocol: class {
  var view: MovieDetailViewProtocol? { get set }
  var interactor: MovieDetailInteractorInputProtocol? { get set }
  var wireFrame: MovieDetailWireFrameProtocol? { get set }
  /**
  * Add here your methods for communication VIEW -> PRESENTER
  */
  func viewDidLoad()
}

protocol MovieDetailInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol MovieDetailInteractorInputProtocol: class
{
    var presenter: MovieDetailInteractorOutputProtocol? { get set }
    var APIDataManager: MovieDetailAPIDataManagerInputProtocol? { get set }
    var localDatamanager: MovieDetailLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol MovieDetailDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol MovieDetailAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol MovieDetailLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
