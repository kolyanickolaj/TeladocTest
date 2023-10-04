//
//  StartViewController.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

final class StartViewController: UIViewController {
    
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}
