//
//  MoviesListViewController.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import UIKit

class MoviesListViewController: UIViewController, MoviesListViewProtocol {
  
  var presenter: MoviesListPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  func reloadTable() {
    print("Reload data")
  }
}
