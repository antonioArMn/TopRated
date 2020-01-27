//
//  MovieDetailInteractor.swift
//  TopTenMovies
//
//  Created by José Antonio Arellano Mendoza on 01/27/2020.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorInputProtocol {

    weak var presenter: MovieDetailInteractorOutputProtocol?
    var APIDataManager: MovieDetailAPIDataManagerInputProtocol?
    var localDatamanager: MovieDetailLocalDataManagerInputProtocol?

    init() {}
}

