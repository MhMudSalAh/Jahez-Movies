//
//  MoviesViewModelTests.swift
//  MoviesTests
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import XCTest
import SwiftUI
@testable import Jahez_Movies

@MainActor
final class MoviesViewModelTests: XCTestCase {
    
    private let moviesUseCase = MoviesUseCase(repository: MoviesRepositoryMock())
    private var sut: MoviesViewModel!
    
    @MainActor
    override func setUp() {
        self.sut = MoviesViewModel(
            useCase: moviesUseCase,
            router: Coordinator()
        )
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
    func test_returns_correct_initial_state() {
        XCTAssertEqual(sut.movies.count, 0)
        XCTAssertEqual(sut.filteredMovies.count, 0)
        XCTAssertEqual(sut.categories.count, 0)
    }
    
    func test_returns_correct_fetched_movies_count() async {
        await sut.viewDidLoad()
        XCTAssertEqual(sut.filteredMovies.count, 2)
    }
    
    func test_returns_correct_fetched_categories_count() async {
        await sut.viewDidLoad()
        XCTAssertEqual(sut.categories.count, 2)
    }
    
    func test_returns_correct_fetched_movies_mapping() async {
        await sut.viewDidLoad()
        XCTAssertEqual(sut.filteredMovies.first?.title, "The Super Mario Galaxy Movie")
    }
    
    func test_returns_correct_filtered_movies() async {
        await sut.viewDidLoad()
        
        sut.searchQuery = "Th"
        await Task.yield()
        XCTAssertEqual(sut.filteredMovies.first?.title, "The Super Mario Galaxy Movie")
        
        sut.searchQuery = "The Super Mario Galaxy Movie"
        await Task.yield()
        XCTAssertEqual(sut.filteredMovies.first?.title, "The Super Mario Galaxy Movie")
    }
    
    func test_returns_correct_unfiltered_movies_after_reset() async {
        await sut.viewDidLoad()
        
        sut.searchQuery = "the"
        await Task.yield()
        XCTAssertEqual(sut.filteredMovies.count, 1)
        
        sut.searchQuery = ""
        await Task.yield()
        XCTAssertEqual(sut.filteredMovies.count, 2)
    }
    
    func test_returns_correct_movies_category() async {
        await sut.viewDidLoad()
        
        sut.selectedId = 28
        await Task.yield()
        XCTAssertEqual(sut.filteredMovies.count, 1)
        
        sut.selectedId = 12
        await Task.yield()
        XCTAssertEqual(sut.filteredMovies.count, 2)
    }
}
