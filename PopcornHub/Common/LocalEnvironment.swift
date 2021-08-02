//
//  LocalEnvironment.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 28/07/21.
//

import Foundation
import UIKit

struct Environment {
	enum VariableNames: String {
		case baseUrl = "TMDB_BASE_URL"
		case apiKey = "TMDB_API_KEY"
		case imageBaseUrl = "TMDB_IMAGE_BASE_URL"
	}
	
	static func getEnvironmentVariable(name: VariableNames) -> String {
		let environmentDictionary = Bundle.main.infoDictionary!
		return environmentDictionary[name.rawValue] as? String ?? ""
	}
}

