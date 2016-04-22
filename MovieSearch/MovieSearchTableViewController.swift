//
//  MovieSearchTableViewController.swift
//  MovieSearch
//
//  Created by admin on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    var searchResults = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let searchTerm = searchBar.text ?? ""
        
        MovieController.getMoviesWithSearchTerm(searchTerm) { (movies) in
            self.searchResults = movies!
            dispatch_async(dispatch_get_main_queue(), { () in
                self.tableView.reloadData()
            })
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieResultsCell", forIndexPath: indexPath) as! MovieResultsTableViewCell
        let movie = searchResults[indexPath.row]
        cell.updateCellWithMovie(movie)
        


        return cell
    }

}
