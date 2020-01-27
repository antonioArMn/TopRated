//
//  MovieDetailPresenter.swift
//  TopTenMovies
//
//  Created by José Antonio Arellano Mendoza on 01/27/2020.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol, MovieDetailInteractorOutputProtocol {
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorInputProtocol?
    var wireFrame: MovieDetailWireFrameProtocol?

    init() {}
}
