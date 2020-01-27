//
//  TMDBResponse.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import Foundation

struct TMDBResponse: Codable {
  let statusCode: Int
  let statusMessage: String
  
  enum CodingKeys: String, CodingKey {
    case statusCode = "status_code"
    case statusMessage = "status_message"
  }
}

extension TMDBResponse: LocalizedError {
  var errorDescription: String? {
    return statusMessage
  }
}
