//
//  WordTableViewCell.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

final class WordTableViewCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    func update(with model: WordModel) {
        titleLabel.text = model.word
        counterLabel.text = "\(model.count)"
    }
    
}
