//
//  TabBarViewController.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
	
	// MARK: - View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setupViewControllers()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupViewControllers()
	}
	
	// MARK: - Setup
	
	private func setupUI() {
		// Set TabBar Appearance
		tabBar.barTintColor = UIColor.white
		tabBar.tintColor = UIColor.red
		tabBar.unselectedItemTintColor = UIColor.lightGray
		tabBar.isTranslucent = false
		tabBar.shadowImage = UIImage()
		tabBar.backgroundImage = UIImage()

		// Add TabBar shadow
		tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
		tabBar.layer.shadowRadius = 16
		tabBar.layer.shadowColor = UIColor.black.cgColor
		tabBar.layer.shadowOpacity = 0.10
	}
	
	private func setupViewControllers() {
		var viewControllers = [UIViewController]()
		
		let popularMoviesViewController = PopularMoviesViewController(nibName: NibNames.PopularMovies, bundle: nil)
		popularMoviesViewController.tabBarItem = UITabBarItem(title: LocalStrings.PopularMovies.title, image: LocalImages.PopularMovies.popularIcon, selectedImage: LocalImages.PopularMovies.popularIcon)
		let popularMoviesNavigationController = UINavigationController(rootViewController: popularMoviesViewController)
		viewControllers.append(popularMoviesNavigationController)
		
		let topRatedMoviesViewController = TopRatedMoviesViewController(nibName: NibNames.TopRated, bundle: nil)
		topRatedMoviesViewController.tabBarItem = UITabBarItem(title: LocalStrings.TopRatedMovies.title, image: LocalImages.TopRatedMovies.podiumIcon, selectedImage: LocalImages.TopRatedMovies.podiumIcon)
		let topRatedMoviesNavigationController = UINavigationController(rootViewController: topRatedMoviesViewController)
		viewControllers.append(topRatedMoviesNavigationController)
		
		let upcomingMoviesViewController = UpcomingMoviesViewController(nibName: NibNames.Upcoming, bundle: nil)
		upcomingMoviesViewController.tabBarItem = UITabBarItem(title: LocalStrings.UpcomingMovies.title, image: LocalImages.UpcomingMovies.soonIcon, selectedImage: LocalImages.UpcomingMovies.soonIcon)
		let upcomingMoviesNavigationController = UINavigationController(rootViewController: upcomingMoviesViewController)
		viewControllers.append(upcomingMoviesNavigationController)
		
		setViewControllers(viewControllers, animated: true)
		selectedViewController = popularMoviesNavigationController
	}
}
