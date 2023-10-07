//
//  String+Ext.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 6.10.23.
//

import Foundation

extension String {
    var words: [String] {
        var array: [String] = []
        enumerateSubstrings(in: startIndex ..< endIndex, options: .byWords) { substring, _, _, _ in
            if let substring,
                !substring.isEmpty
            {
                array.append(substring.capitalized)
            }
        }
        return array
    }
}
