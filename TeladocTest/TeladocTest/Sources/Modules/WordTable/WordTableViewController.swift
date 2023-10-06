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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Words"
        tableView.register(WordTableViewCell.self)
        fetchContent()
    }
    
    private func fetchContent() {
        guard let path = Bundle.main.path(forResource: Constants.testFileName, ofType: Constants.testFileExtension) else { return }
        
        setUI(enabled: false)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let countedModels = WordsCountingService().getCountedWords(from: path),
                  !countedModels.isEmpty
            else {
                DispatchQueue.main.async { [weak self] in
                    self?.setUI(enabled: true)
                }
                
                return
            }
            
            self?.models = countedModels.sorted(by: { $0.count > $1.count })
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.setUI(enabled: true)
            }
        }
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

extension WordTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.identifier) as? WordTableViewCell else { return UITableViewCell() }
        
        cell.update(with: models[indexPath.row])
        return cell
    }
}

extension WordTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
