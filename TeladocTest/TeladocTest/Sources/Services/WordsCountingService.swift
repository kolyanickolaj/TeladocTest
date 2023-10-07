//
//  WordsCountingService.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import Foundation

protocol WordsCountingServiceProtocol {
    func getCountedWords(from filePath: String) -> [WordModel]?
}

final class WordsCountingService: WordsCountingServiceProtocol {
    func getCountedWords(from filePath: String) -> [WordModel]? {
        guard let fileName = filePath.components(separatedBy: "/").last else { return nil }
        
        if let value = getSavedValue(fileName: fileName) {
            return value
        }
        
        guard let words = TextParser().getAllWords(fromFile: filePath) else { return nil }
        
        let countedSetOfWords = NSCountedSet(array: words)
        let models: [WordModel] = countedSetOfWords.compactMap({ word in
            if let word = word as? String {
                return WordModel(word: word, count: countedSetOfWords.count(for: word))
            }
            return nil
        })
        
        saveValue(models, fileName: fileName)
        return models
    }
    
    private func getSavedValue(fileName: String) -> [WordModel]? {
        guard let dict = UserDefaults.standard.dictionary(forKey: fileName) else { return nil }
        
        var models: [WordModel] = []
        for (key, value) in dict {
            guard let intValue = value as? Int else { continue }
            
            models.append(WordModel(word: key, count: intValue))
        }
        
        return models
    }
    
    private func saveValue(_ value: [WordModel], fileName: String) {
        var dict: [String:Int] = [:]
        value.forEach { model in
            dict[model.word] = model.count
        }
        
        UserDefaults.standard.set(dict, forKey: fileName)
    }
}
