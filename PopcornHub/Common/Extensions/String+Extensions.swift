//
//  String+Extensions.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 29/07/21.
//

import Foundation

extension String {
	func TMDBImageUrl(size tmdbImageSize: TMDBImageSize) -> String {
		let baseUrl = Environment.getEnvironmentVariable(name: .imageBaseUrl)
		let imageSize = tmdbImageSize.rawValue
		return baseUrl + imageSize + self
	}
}
