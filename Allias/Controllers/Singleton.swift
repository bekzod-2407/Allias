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
    var teamArray: Array = [""]
    
    
}
