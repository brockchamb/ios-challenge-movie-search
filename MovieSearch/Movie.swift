//
//  Movie.swift
//  MovieSearch
//
//  Created by admin on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit


class Movie {
    
    let title: String
    let rating: Float
    let summary: String
    
    init?(dictionary:[String:AnyObject]) {
        guard let title = dictionary["title"] as? String,
            let rating = dictionary["vote_average"] as? Float,
            let summary = dictionary["overview"] as? String where !summary.isEmpty else {
                self.title = ""
                self.summary = ""
                self.rating = 0
                return nil
        }
        self.title = title
        self.summary = summary
        self.rating = rating
    }
    
}
