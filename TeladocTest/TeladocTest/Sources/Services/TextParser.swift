//
//  WordsParser.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import Foundation

protocol TextParserProtocol {
    func getAllWords(fromFile path: String) -> [String]?
}

final class TextParser: TextParserProtocol {
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
}

