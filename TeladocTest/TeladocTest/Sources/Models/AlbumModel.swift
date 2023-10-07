//
//  AlbumModel.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import Foundation

struct AlbumModel: Codable {
    let title: String
    let cover: String
    let releaseDateString: String
    
    var releaseDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.date(from: releaseDateString) ?? Date.now
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "collectionName"
        case cover = "artworkUrl100"
        case releaseDateString = "releaseDate"
    }
}
