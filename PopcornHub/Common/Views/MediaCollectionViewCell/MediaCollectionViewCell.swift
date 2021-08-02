//
//  MediaCollectionViewCell.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 28/07/21.
//

import UIKit
import Kingfisher

class MediaCollectionViewCell: UICollectionViewCell {
	// MARK: - IBOutlets
	
	@IBOutlet private(set) weak var mediaImageView: UIImageView!
	@IBOutlet private(set) weak var titleLabel: UILabel!
	@IBOutlet private(set) weak var firstInformationLabel: UILabel!
	@IBOutlet private(set) weak var secondInformationLabel: UILabel!
	
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
		firstInformationLabel.text = displayableMedia.firstInformationData
		secondInformationLabel.text = displayableMedia.secondInformationData
		if let imageUrl = URL(string: displayableMedia.mediaImageUrl.TMDBImageUrl(size: .h632)) {
			mediaImageView.kf.setImage(with: imageUrl, placeholder: LocalImages.Common.placeHolder)
		}
		
		switch displayableMedia.mediaSection {
			case .Popular:
				contentView.layer.borderColor = UIColor.cyan.cgColor
			case .Upcoming:
				contentView.layer.borderColor = UIColor.red.cgColor
			default:
				break
				
		}
	}
	
	private func setupCornerRadious() {
		contentView.layer.cornerRadius = 5.0
		contentView.layer.borderWidth = 2.0
	}
}
