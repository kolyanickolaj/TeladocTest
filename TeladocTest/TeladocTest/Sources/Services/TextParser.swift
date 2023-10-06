//
//  WordsParser.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import Foundation

final class TextParser {
    func getAllWords(fromFile path: String) -> [String]? {
        var arrayOfWords: [String]?
        let encodings: [String.Encoding] = [.utf8, .macOSRoman, .utf16]
        for encoding in encodings {
            if let string = try? String(contentsOfFile: path, encoding: encoding) {
                arrayOfWords = string.words
                break
            }
        }
        
        return arrayOfWords
    }
    
    func getAllWords(from string: String) -> [String] {
        string.words
    }
}

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
