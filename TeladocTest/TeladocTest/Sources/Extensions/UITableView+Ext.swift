//
//  UITableView+Ext.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import UIKit

extension UITableView {
    final func register<T: UITableViewCell>(_ cellType: T.Type) where T:  NibLoadable {
        register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    final func register<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) where T:  NibLoadable {
        register(headerFooter.nib, forHeaderFooterViewReuseIdentifier: headerFooter.identifier)
    }
}

protocol NibLoadable: AnyObject {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var identifier: String {
        String(describing: self)
    }
}

