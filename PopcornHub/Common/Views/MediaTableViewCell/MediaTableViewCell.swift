//
//  MediaTableViewCell.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 29/07/21.
//

import Foundation
import UIKit

class MediaTableViewCell: UITableViewCell {
	// MARK: - IBOutlets
	@IBOutlet private(set) weak var containerView: UIView!
	@IBOutlet private(set) weak var mediaImageView: UIImageView!
	@IBOutlet private(set) weak var titleLabel: UILabel!
	@IBOutlet private(set) weak var overviewLabel: UILabel!
	@IBOutlet private(set) weak var votesLabel: UILabel!
	
	
	// MARK: - Init
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		mediaImageView.kf.cancelDownloadTask()
		mediaImageView.image = nil
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setupCornerRadious()
	}
	
	// MARK: - Helpers
	
	func update(displayableMedia: DisplayableMedia) {
		titleLabel.text = displayableMedia.title
		overviewLabel.text = displayableMedia.firstInformationData
		votesLabel.text = displayableMedia.secondInformationData
		if let imageUrl = URL(string: displayableMedia.mediaImageUrl.TMDBImageUrl(size: .h632)) {
			mediaImageView.kf.setImage(with: imageUrl, placeholder: LocalImages.Common.placeHolder)
		}
	}
	
	private func setupCornerRadious() {
		containerView.layer.cornerRadius = 5.0
		containerView.layer.borderWidth = 2.0
		containerView.layer.borderColor = UIColor.yellow.cgColor
	}
}
