//
//  MediaContentCell.swift
//  iTunesSearch
//
//  Created by Guido Moyano Bertero on 27/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import UIKit

class MediaContentCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgArtwork: UIImageView!
    
    func configure(mediaContent:MediaContent, mediaType:MediaType) {
        self.lblTitle.text = mediaContent.trackName
        imgArtwork.load(url: URL(string: mediaContent.artWorkURL)!)
        
        switch mediaType {
        case .tvShow:
            self.lblTitle.text = mediaContent.artistName
            self.lblSubtitle.text = mediaContent.trackName
            self.lblDescription.text = mediaContent.longDescription
        case .movie:
            self.lblTitle.text = mediaContent.trackName
            self.lblSubtitle.text = nil
            self.lblDescription.text = mediaContent.longDescription
        case .music:
            self.lblTitle.text = mediaContent.trackName
            self.lblSubtitle.text = mediaContent.artistName
            self.lblDescription.text = nil
        }
    }

}
