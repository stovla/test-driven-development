//
//  Movie.swift
//  FilmFestTDD
//
//  Created by Vlastimir on 3/12/19.
//  Copyright © 2019 Vlastimir. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title != rhs.title {
        return false
    }
    if lhs.releaseDate != rhs.releaseDate {
        return false
    }
    return true
}
