//
//  MovieDetailWireFrame.swift
//  TopTenMovies
//
//  Created by José Antonio Arellano Mendoza on 01/27/2020.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailWireFrame: MovieDetailWireFrameProtocol {

    class func createMovieDetailModule(for movie: Movie) -> UIViewController {
      
      let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailController")
      
      if let view = viewController as? MovieDetailViewController {
        let presenter: MovieDetailPresenterProtocol & MovieDetailInteractorOutputProtocol = MovieDetailPresenter(movie: movie)
        let interactor: MovieDetailInteractorInputProtocol = MovieDetailInteractor()
        let APIDataManager: MovieDetailAPIDataManagerInputProtocol = MovieDetailAPIDataManager()
        let localDataManager: MovieDetailLocalDataManagerInputProtocol = MovieDetailLocalDataManager()
        let wireFrame: MovieDetailWireFrameProtocol = MovieDetailWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
        return viewController
      }
      return UIViewController()
    }
  
  static var mainStoryboard: UIStoryboard {
      return UIStoryboard(name: "Main", bundle: Bundle.main)
  }
}
