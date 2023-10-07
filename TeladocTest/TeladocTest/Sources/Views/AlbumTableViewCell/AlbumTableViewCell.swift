//
//  AlbumTableViewCell.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit
import SDWebImage

protocol AlbumTableViewCellProtocol {
    func update(with model: AlbumModel)
}

final class AlbumTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}

extension AlbumTableViewCell: AlbumTableViewCellProtocol {
    func update(with model: AlbumModel) {
        titleLabel.text = model.title
        coverImageView.layer.cornerRadius = 5
        coverImageView.sd_setImage(with: URL(string: model.cover))
    }
}
