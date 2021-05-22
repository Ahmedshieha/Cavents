//
//  City.swift
//  Cavents
//
//  Created by Reda on 26/01/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation

public struct Event :Codable {

    let eventName: String?
    let eventPlace: String?
    let eventDate : String?
    let imageUrl : String?
    let description : String?
    let eventTime : String?

  enum CodingKeys: String, CodingKey {
    case eventName
    case eventPlace
    case eventDate
    case imageUrl
    case description
    case eventTime
}

}
