//
//  AlbumsTableViewController.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

final class AlbumsTableViewController: UIViewController {
    
    private var models: [AlbumModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Albums"
        tableView.register(AlbumTableViewCell.self)
        fetchAlbums()
    }
    
    private func fetchAlbums() {
        setUI(enabled: false)
        NetworkManager.shared.getBeatlesAlbums(completion: { [weak self] models in
            guard let models,
                  !models.isEmpty
            else {
                DispatchQueue.main.async { [weak self] in
                    self?.setUI(enabled: true)
                }
                return
            }
            
            self?.models = models.sorted(by: { $0.releaseDate.compare($1.releaseDate) == .orderedAscending })
            DispatchQueue.main.async {[weak self] in
                self?.setUI(enabled: true)
                self?.tableView.reloadData()
            }
        })
    }
    
    private func setUI(enabled: Bool) {
        activityIndicator.isHidden = enabled
        tableView.isUserInteractionEnabled = enabled
        if enabled {
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }
    }
}

extension AlbumsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier) as? AlbumTableViewCell else { return UITableViewCell() }
        
        cell.update(with: models[indexPath.row])
        return cell
    }
}

extension AlbumsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
