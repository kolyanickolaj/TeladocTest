//
//  StartViewController.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

final class StartViewController: UIViewController {
    
    @IBAction func questionOneTapped(_ sender: Any) {
        let vc: WordTableViewController = .loadFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func questionTwoTapped(_ sender: Any) {
        let vc: AlbumsTableViewController = .loadFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
}

