//
//  MoviesListLocalDataManager.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MoviesListLocalDataManager: MoviesListLocalDataManagerInputProtocol {
  
  init() {}
  
  func saveMoviesInDB(movies: [Movie]) {
    for movie in movies {
      let managedContext = getConnection()
      let entity = NSEntityDescription.entity(forEntityName: "MovieModel", in: managedContext)!
      let movieModel = NSManagedObject(entity: entity, insertInto: managedContext)
      movieModel.setValue(movie.title, forKey: "title")
      movieModel.setValue(movie.posterPath, forKey: "posterPath")
      movieModel.setValue(movie.releaseDate, forKey: "releaseDate")
      movieModel.setValue(movie.voteAverage, forKey: "average")
      movieModel.setValue(movie.overview, forKey: "overview")
      
      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
  }
  
  func retriveMoviesFromDB() -> [Movie] {
    var movies: [Movie] = []
    let managedContext = getConnection()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieModel")
    do {
      let result = try managedContext.fetch(fetchRequest)
      for data in result as! [NSManagedObject] {
        let title = data.value(forKey: "title") as! String
        let posterPath = data.value(forKey: "posterPath") as! String
        let average = data.value(forKey: "average") as! Double
        let releaseDate = data.value(forKey: "releaseDate") as! String
        let overview = data.value(forKey: "overview") as! String
        let movie = Movie(posterPath: posterPath, overview: overview, releaseDate: releaseDate, title: title, voteAverage: average)
        movies.append(movie)
      }
      return movies
    } catch {
      print("Failed")
      return movies
    }
  }
  
  func deleteMoviesFromDB() {
    let managedContext = getConnection()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieModel")
    let delete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    do {
        try managedContext.execute(delete)
    } catch let error as NSError {
        print("Error: \(error.localizedDescription)")
    }
  }
  
  private func getConnection() -> NSManagedObjectContext{
      let delegate = UIApplication.shared.delegate as! AppDelegate
      return delegate.persistentContainer.viewContext
  }
}
