//
//  MovieListViewModelTests.swift
//  MovieSwiftUITests
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import XCTest
import Foundation
import Combine
@testable import MovieSwiftUI

final class MovieListViewModelTests: XCTestCase {
    
    var viewModel: MovieListViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = MovieListViewModel()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testAddSubscribers() {
        // Given
        let expectation = XCTestExpectation(description: "Subscribers receive data")
        
        // When
        viewModel.addSubscribers()
        
        // Then
        viewModel.$nowPlayingMovies
            .sink { movies in
                if !movies.isEmpty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
        XCTAssertFalse(viewModel.nowPlayingMovies.isEmpty)
    }
    
    func testFetchNextPage() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch next page updates movies")
        
        // When
        viewModel.fetchNextPage()
        
        // Then
        viewModel.$nowPlayingMovies
            .sink { movies in
                if !movies.isEmpty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
        XCTAssertFalse(viewModel.nowPlayingMovies.isEmpty)
    }
    
}
