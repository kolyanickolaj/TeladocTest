//
//  AlbumsTableViewController.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

final class AlbumsTableViewController: UIViewController {
    
    var models: [AlbumModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(AlbumTableViewCell.self)
    }
}

extension AlbumsTableViewController: UITableViewDelegate {
    
}

extension AlbumsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier) as? AlbumTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
