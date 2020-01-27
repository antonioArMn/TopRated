//
//  MoviesListAPIDataManager.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation

class MoviesListAPIDataManager: MoviesListAPIDataManagerInputProtocol {
  
  static let apiKey = "86237dc45834e2228f30e80f699be01b"
  
  enum Endpoints {
    
    static let base = "https://api.themoviedb.org/3"
    static let apiKeyParam = "?api_key=\(MoviesListAPIDataManager.apiKey)"
    
    case getTopRatedMovies
    case getPosterImage(String)
    
    var stringValue: String {
      switch self {
      case .getTopRatedMovies:
        return Endpoints.base + "/movie/top_rated" + Endpoints.apiKeyParam
      case .getPosterImage(let posterPath):
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
      }
    }
    
    var url: URL {
      return URL(string: stringValue)!
    }
  }
  
  init() {}
  
  private func taskForGETRequest<ResponseType: Decodable>(url: URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            DispatchQueue.main.async {
                completion(nil, error)
            }
            return
        }
        let decoder = JSONDecoder()
        do {
            let responseObject = try decoder.decode(ResponseType.self, from: data)
            DispatchQueue.main.async {
                completion(responseObject, nil)
            }
        } catch {
            do {
                let errorResponse = try decoder.decode(TMDBResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(nil, errorResponse)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
    task.resume()
  }
  
  func retriveTopRatedMovies(completion: @escaping ([Movie], Error?) -> Void) {
    taskForGETRequest(url: Endpoints.getTopRatedMovies.url, response: MovieResults.self) { (response, error) in
      if let response = response {
        completion(response.results, nil)
      } else {
        completion([], error)
      }
    }
  }
  
  class func downloadPosterImage(posterPath: String, completion: @escaping (Data?, Error?) -> Void) {
      let task = URLSession.shared.dataTask(with: Endpoints.getPosterImage(posterPath).url) { (data, response, error) in
          DispatchQueue.main.async {
              completion(data, error)
          }
      }
      task.resume()
  }
}
