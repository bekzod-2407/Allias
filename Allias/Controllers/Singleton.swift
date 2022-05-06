//
//  Singleton.swift
//  Allias
//
//  Created by Артем Оголец on 04.05.2022.
//

import Foundation

final class SingletonStruct {
    
    static var shared = SingletonStruct()
    
    var roundTime: Int = 0
    var wordCount: Int = 0
    var taskRateExplanation: Int = 0
    
//    var teamArray: Array = [String]()
//    var teamDictionary: Dictionary = [String: Int]()
    var teamArray: Array = ["❤️ Lovers", "💀 DeathEaters", "🤖 Robots", "🧔🏻‍♂️ Mens", "👯‍♀️ Women"]
    var teamDictionary: Dictionary = ["❤️ Lovers": 0, "💀 DeathEaters": 0, "🤖 Robots": 0, "🧔🏻‍♂️ Mens": 0, "👯‍♀️ Women": 0]
    
}
