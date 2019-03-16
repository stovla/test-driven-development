//
//  MovieManagerTests.swift
//  FilmFestTDDTests
//
//  Created by Vlastimir on 3/12/19.
//  Copyright © 2019 Vlastimir. All rights reserved.
//

import XCTest
@testable import FilmFestTDD

class MovieManagerTests: XCTestCase {
    var sut: MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Initialization section
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: arthouseMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie.title, movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    // MARK: Equatable section
    func testEquatable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1999")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2018")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    // MARK: Clearing and resetting
    func testClearArrays_ReturnsArrayCountsZero() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
