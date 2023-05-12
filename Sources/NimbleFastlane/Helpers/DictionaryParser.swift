//
//  File.swift
//  
//
//  Created by Bliss on 12/5/23.
//

import Foundation

func parseDictionary(fromString: String, function: String = #function) -> [String: String] {
    return parseDictionaryHelper(fromString: fromString, function: function) as! [String: String]
}

func parseDictionary(fromString: String, function: String = #function) -> [String: Any] {
    return parseDictionaryHelper(fromString: fromString, function: function)
}

func parseDictionaryHelper(fromString: String, function: String = #function) -> [String: Any] {
    let potentialDictionary: String
    if fromString.count < 2 {
        potentialDictionary = "{}"
    } else {
        potentialDictionary = fromString
    }
    let dictionary: [String: Any] = try! JSONSerialization.jsonObject(with: potentialDictionary.data(using: .utf8)!, options: []) as! [String: Any]
    return dictionary
}
