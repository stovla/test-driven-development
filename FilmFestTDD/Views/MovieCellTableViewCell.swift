//
//  MovieCellTableViewCell.swift
//  FilmFestTDD
//
//  Created by Vlastimir on 3/17/19.
//  Copyright © 2019 Vlastimir. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configMovieCell(movie: Movie) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
    }
}
