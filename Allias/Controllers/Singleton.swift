//
//  Singleton.swift
//  Allias
//
//  Created by Артем Оголец on 04.05.2022.
//

import Foundation

final class OptionsStruct {
    
    static var shared = OptionsStruct()
    
    var roundTime: Int = 0
    var wordCount: Int = 0
    var taskRateExplanation: Int = 0
    var teamArray: Array = [""]
    
    
}
