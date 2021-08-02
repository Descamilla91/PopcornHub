//
//  DisplayableMedia.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 28/07/21.
//

import Foundation
import UIKit

public protocol DisplayableMedia {
	var title: String { get set }
	var firstInformationData: String { get set }
	var secondInformationData: String { get set }
	var mediaImageUrl: String { get set }
	var mediaSection: Section { get set }
}

public enum Section {
	case Popular
	case TopRated
	case Upcoming
}
