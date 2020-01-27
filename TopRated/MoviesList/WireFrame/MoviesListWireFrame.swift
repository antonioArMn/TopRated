//
//  MoviesListWireFrame.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

class MoviesListWireFrame: MoviesListWireFrameProtocol {
  
  static var moviesListStoryboard: UIStoryboard {
    return UIStoryboard(name: "Main", bundle: Bundle.main)
  }
  
  static func presentMoviesListModule() -> UIViewController {
    let navController = moviesListStoryboard.instantiateViewController(withIdentifier: "MoviesNavigationController")
    if let view = navController.children.first as? MoviesListViewController {
      let presenter: MoviesListPresenterProtocol & MoviesListInteractorOutputProtocol = MoviesListPresenter()
      let interactor: MoviesListInteractorInputProtocol = MoviesListInteractor()
      let APIDataManager: MoviesListAPIDataManagerInputProtocol = MoviesListAPIDataManager()
      let localDataManager: MoviesListLocalDataManagerInputProtocol = MoviesListLocalDataManager()
      let wireFrame: MoviesListWireFrameProtocol = MoviesListWireFrame()
      
      view.presenter = presenter
      presenter.view = view
      presenter.wireFrame = wireFrame
      presenter.interactor = interactor
      interactor.presenter = presenter
      interactor.APIDataManager = APIDataManager
      interactor.localDatamanager = localDataManager
      
      return navController
    }
    return UIViewController()
  }
  
  func presentMovieDetailScreen(from view: MoviesListViewProtocol, forMovie movie: Movie) {
    let movieDetailVC = MovieDetailWireFrame.createMovieDetailModule(for: movie)
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
  }
}
