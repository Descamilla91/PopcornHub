//
//  LocalStrings.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//

import Foundation

enum LocalStrings {
	enum Common {
		static let doNotExist = "N/A"
	}
	enum PopularMovies {
		static let title = "Populares"
	}
	
	enum TopRatedMovies {
		static let title = "Top"
	}
	
	enum UpcomingMovies {
		static let title = "Proximamente"
	}
	
	enum SearchMovies {
		static let title = "Busqueda"
	}
	
	enum Detail {
		static let titleKey = "Título: "
		static let languageKey = "Lenguaje: "
		static let dateKey = "Fecha: "
		static let averageVotesKey = "Promedio: "
		static let totalVotesKey = "Votos: "
	}
	
	enum MediaCell {
		static let titleKeyLabel = "Título: "
		static let languageKeyLabel = "Lenguaje: "
		static let dateKeyLabel = "Fecha: "
		static let votesKeyLabel = "Votos: "
		static let popularityKeyLabel = "Popularidad: "
	}
}
