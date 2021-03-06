//
//  UpcomingMoviesViewControllerTests.swift
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

class UpcomingMoviesViewControllerTests: XCTestCase {
    
    // MARK: Subject under test
    
    var sut: UpcomingMoviesViewController!
    var window: UIWindow!
	var interactorSpy: UpcomingMoviesInteractorSpy!
	var routerSpy: UpcomingMoviesRouterSpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupUpcomingMoviesViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupUpcomingMoviesViewController() {
		sut = UpcomingMoviesViewController(nibName: NibNames.Upcoming, bundle: nil)
		interactorSpy = UpcomingMoviesInteractorSpy()
		routerSpy = UpcomingMoviesRouterSpy()
		sut.interactor = interactorSpy
		sut.router = routerSpy
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Tests
    
    func testViewDidLoad() {
        // When
		loadView()
        
        // Then
		XCTAssert(interactorSpy?.fetchUpcomingMoviesCalled ?? false)
    }
    
    func testDisplaySomething() {
        // Given
		loadView()
		let selectedIndex = 0
		let displayableMediaList = Dummies.Common.displayableUpcomingMovies
		sut.viewModel = UpcomingMoviesModels.FetchUpcomingMovies.ViewModel(displayableMediaList: displayableMediaList)
		sut.upcomingMoviesCollectionView.reloadData()
        
        // When
		sut.collectionView(sut.upcomingMoviesCollectionView, didSelectItemAt: IndexPath(row: selectedIndex, section: 0))
		
        // Then
		XCTAssert(interactorSpy.selectUpcomingMovieCalled)
		XCTAssertEqual(interactorSpy.selectUpcomingMovieRequest?.index, selectedIndex)
    }
}

// MARK: Test doubles

class UpcomingMoviesInteractorSpy: UpcomingMoviesInteractorInterface {
	var fetchUpcomingMoviesCalled = false
	func fetchUpcomingMovies() {
		fetchUpcomingMoviesCalled = true
	}
	
	var selectUpcomingMovieCalled = false
	var selectUpcomingMovieRequest: UpcomingMoviesModels.SelectUpcomingMovie.Request?
	func selectUpcomingMovie(request: UpcomingMoviesModels.SelectUpcomingMovie.Request) {
		selectUpcomingMovieCalled = true
		selectUpcomingMovieRequest = request
	}
}

class UpcomingMoviesRouterSpy: UpcomingMoviesRouterInterface, UpcomingMoviesDataPassing {
	var dataStore: UpcomingMoviesDataStore?
	var routToMovieDetailCalled = false
	func routToMovieDetail() {
		routToMovieDetailCalled = true
	}
}
