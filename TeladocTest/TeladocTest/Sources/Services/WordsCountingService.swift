//
//  WordsCountingService.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 4.10.23.
//

import Foundation

final class WordsCountingService {
    func getCountedWords(from filePath: String) -> [WordModel]? {
        guard let fileName = filePath.components(separatedBy: "/").last else { return nil }
        
        if let value = getSavedValue(fileName: fileName) {
            return value
        }
        
        guard let words = TextParser().getAllWords(fromFile: filePath) else { return nil }
        
        let uniqueWords: Set<String> = Set(words)
        let models = uniqueWords.map({ word in
            let wordCount = words.filter({ $0 == word }).count
            return WordModel(word: word, count: wordCount)
        })
        
        saveValue(models, fileName: fileName)
        return models
    }
    
    func getSavedValue(fileName: String) -> [WordModel]? {
        guard let dict = UserDefaults.standard.dictionary(forKey: fileName) else { return nil }
        
        var models: [WordModel] = []
        for (key, value) in dict {
            guard let intValue = value as? Int else { continue }
            
            models.append(WordModel(word: key, count: intValue))
        }
        
        return models
    }
    
    func saveValue(_ value: [WordModel], fileName: String) {
        var dict: [String:Int] = [:]
        value.forEach { model in
            dict[model.word] = model.count
        }
        
        UserDefaults.standard.set(dict, forKey: fileName)
    }
}
