//
//  MovieDetailsViewModelTests.swift
//  MovieDetailsTests
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import XCTest
@testable import Jahez_Movies

@MainActor
final class MovieDetailsViewModelTests: XCTestCase {
    
    private var movieUseCase: MovieDetailsUseCase!
    private var sut: MovieDetailsViewModel!
    
    override func setUp() {
        movieUseCase = MovieDetailsUseCase(repository: MovieDetailsRepositoryMock())
        sut = MovieDetailsViewModel(
            useCase: movieUseCase,
            movie: MovieDetailsDataSource().movie
        )
    }
    
    override func tearDown() {
        sut = nil
        movieUseCase = nil
    }
    
    func test_returns_correct_movie_after_fetch() async {
        await sut.viewDidLoad()
        XCTAssertEqual(sut.movie.id, MovieDetailsDataSource().movie.id)
        XCTAssertEqual(sut.movie.title, MovieDetailsDataSource().movie.title)
    }
}
