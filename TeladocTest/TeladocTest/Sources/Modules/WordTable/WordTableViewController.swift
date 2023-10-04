//
//  WordTableViewController.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

final class WordTableViewController: UIViewController {
    
    var models: [WordModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(WordTableViewCell.self)
    }
    
}

extension WordTableViewController: UITableViewDelegate {
    
}

extension WordTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.identifier) as? WordTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
