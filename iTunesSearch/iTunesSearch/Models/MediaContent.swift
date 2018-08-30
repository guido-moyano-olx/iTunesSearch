//
//  MediaContent.swift
//  iTunesSearch
//
//  Created by Guido Moyano Bertero on 27/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import Foundation
import SwiftyJSON

enum MediaType: String {
    case movie = "movie"
    case tvShow = "tvShow"
    case music = "music"
}

class MediaContent: NSObject {
    var trackName: String
    var artistName: String?
    var artWorkURL: String
    var longDescription: String?
    var previewURL: String
    
    init(trackName: String, artistName: String?, artWorkUrl: String, longDescription: String?, previewUrl: String) {
        self.trackName = trackName
        self.artistName = artistName
        self.artWorkURL = artWorkUrl
        self.longDescription = longDescription
        self.previewURL = previewUrl
    }
    
    init(JSON:JSON) {
        self.trackName = JSON["trackName"].stringValue
        self.artWorkURL = JSON["artworkUrl100"].stringValue
        self.previewURL = JSON["previewUrl"].stringValue
        self.artistName = JSON["artistName"].string
        self.longDescription = JSON["longDescription"].string
    }
}
