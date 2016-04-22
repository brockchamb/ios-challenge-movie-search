//
//  MovieController.swift
//  MovieSearch
//
//  Created by admin on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit


class MovieController {
    
    static func getMoviesWithSearchTerm(searchTerm:String, completion:(movieArray:[Movie]?) -> Void){
        
        let url = NetworkController.baseURL(searchTerm)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let data = resultData else {
                print("No Data Returned")
                completion(movieArray: nil)
                return
            }
            
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject] {
                    if let resultsArray = resultsDictionary["results"] as? [[String:AnyObject]]
                    {
                        var arrayOfMovies:[Movie] = []
                        for movieDictionary in resultsArray {
                            if let movie = Movie(dictionary: movieDictionary) {
                                arrayOfMovies.append(movie)
                            }
                        }
                        completion(movieArray: arrayOfMovies)
                    } else {
                        completion(movieArray: nil)
                    }
                }
            } catch {
                completion(movieArray: nil)
            }
        }
    }
    
}
