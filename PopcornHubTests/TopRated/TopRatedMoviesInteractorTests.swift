//
//  TopRatedMoviesInteractorTests.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 02/08/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import PopcornHub
import XCTest

class TopRatedMoviesInteractorTests: XCTestCase {
    
    // MARK: Subject under test
    
    var sut: TopRatedMoviesInteractor!
	var presenterSpy: TopRatedMoviesPresenterSpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupTopRatedMoviesInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupTopRatedMoviesInteractor() {
        sut = TopRatedMoviesInteractor()
		presenterSpy = TopRatedMoviesPresenterSpy()
		sut.presenter = presenterSpy
    }
    
    // MARK: Tests
	
    func testFetchTopRatedMovies() {
        // Given
		sut.worker = TopRatedWorkerSpy(.Success)
        
        // When
		sut.fetchTopRatedMovies()
        
        // Then
		XCTAssert(presenterSpy?.presentTopRatedMoviesCalled ?? false)
    }
	
	func testSelectTopRatedMovie() {
		// Given
		let selectedIndex = 0
		let request = TopRatedMoviesModels.SelectTopRatedMovie.Request(index: selectedIndex)
		let dummiesList = Dummies.Common.getMediaList()
		sut.currentMediaList = dummiesList
		
		// When
		sut.selectTopRatedMovie(request: request)
		
		// Then
		XCTAssert(presenterSpy?.presentSelectedTopRatedMovieCalled ?? false)
		XCTAssertEqual(sut.selectedMovie.title, dummiesList[selectedIndex].title)
	}
}

// MARK: Test doubles

class TopRatedMoviesPresenterSpy: TopRatedMoviesPresenterInterface {
	var presentTopRatedMoviesCalled = false
	var presentTopRatedMoviesResponse: TopRatedMoviesModels.FetchTopRatedMovies.Response?
	func presentTopRatedMovies(response: TopRatedMoviesModels.FetchTopRatedMovies.Response) {
		presentTopRatedMoviesCalled = true
		presentTopRatedMoviesResponse = response
	}
	
	var presentSelectedTopRatedMovieCalled = false
	func presentSelectedTopRatedMovie() {
		presentSelectedTopRatedMovieCalled = true
	}
}

class TopRatedWorkerSpy: TopRatedMoviesWorkerInterface {
	public enum WorkerType {
		case Success
		case Failure
	}
	
	var workerType: WorkerType
	
	init(_ type: WorkerType) {
		workerType = type
	}
	
	func fetchTopRatedMovies(request: TopRatedMoviesModels.FetchTopRatedMovies.Request, completion: @escaping (Result<PopularMoviesResponse?, Error>) -> Void) {
		switch workerType {
			case .Success:
				let response = Dummies.Common.getPopularMoviesResponse()
				completion(.success(response))
			case .Failure:
				completion(.failure(Dummies.Common.error))
		}
	}
}
