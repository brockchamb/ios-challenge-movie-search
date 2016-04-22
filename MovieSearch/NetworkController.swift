//
//  NetworkController.swift
//  MovieSearch
//
//  Created by admin on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit


class NetworkController {
    
    static func baseURL(searchTerm:String) -> NSURL {
        let modifiedSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        return NSURL(string: "http://api.themoviedb.org/3/search/movie?query=\(modifiedSearchTerm)&api_key=68a8779098e355ac704c413416c684af")!
    }
    
    static func dataAtURL(url:NSURL, completion:(resultData:NSData?) -> Void){
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
}
