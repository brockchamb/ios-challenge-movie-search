//
//  MovieResultsTableViewCell.swift
//  MovieSearch
//
//  Created by admin on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieResultsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellWithMovie(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.summary

    }

}
