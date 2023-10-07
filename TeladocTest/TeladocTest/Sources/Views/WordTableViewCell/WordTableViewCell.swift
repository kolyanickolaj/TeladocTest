//
//  WordTableViewCell.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

protocol WordTableViewCellProtocol {
    func update(with model: WordModel)
}

final class WordTableViewCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
}

extension WordTableViewCell: WordTableViewCellProtocol {
    func update(with model: WordModel) {
        titleLabel.text = model.word
        counterLabel.text = "\(model.count)"
    }
}
