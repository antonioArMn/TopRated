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

    class func presentMovieDetailModule(fromView vc:UIViewController) {

        // Generating module components
        let stotyboard = UIStoryboard(name: "", bundle: Bundle.main)
        let view: MovieDetailViewProtocol = stotyboard.instantiateViewController(withIdentifier: "") as! MovieDetailViewProtocol
        let presenter: MovieDetailPresenterProtocol & MovieDetailInteractorOutputProtocol = MovieDetailPresenter()
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
        
        
        
    }
}
