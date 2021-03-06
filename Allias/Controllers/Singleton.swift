//
//  Singleton.swift
//  Allias
//
//  Created by Артем Оголец on 04.05.2022.
//

import Foundation

final class SingletonStruct {
    
    static var shared = SingletonStruct()
    
    var roundTime: Int = 2
    var wordCount: Int = 20
  
    //Пастота показа задания
    var howOftenTask: Int = 3
    
    //Показывать задание?
    var showTask: Bool = false
    
    //!!!!!!!(нужна функция на заполнение или заполение из DictionaryView)
    //массив слов выбранного словаря
    //var tempLocalDictionary: Array<String> = []
    var tempLocalDictionary = LocalDictionary().wordsArrayEasy.shuffled()
    var tempWordIdx: Int = 0
    
    //массив действий к словам
    //var taskDictionary: Array<String> = []
    var taskDictionary: Array = LocalDictionary().taskDictionary.shuffled()
    var tempTasksIdx: Int = 0
    

    //команды
    var teamArray: Array = ["💀 DeathEaters", "🤖 Robots"]
    var teamDictionary: Dictionary = ["💀 DeathEaters": 0, "🤖 Robots": 0]
    
    var activCommandIdx: Int = 0
    
    
    //Функция для определения частоты показа задания
    func changeOftenTask(_ tempVal : Int) {
        var retVal = 0
        
        if tempVal == 0 {
            retVal = 0
        } else if tempVal == 1 {
            retVal = 9
        } else if tempVal == 2 {
            retVal = 7
        } else if tempVal == 3 {
            retVal = 5
        }else if tempVal == 4 {
            retVal = 2
        }
        
        howOftenTask = retVal
    }
    
    
    //фунцкция для определения надо ли выводить задание
    func checkTask(){
        if tempWordIdx % howOftenTask == 0 && tempWordIdx != 0 {
            showTask = true
            
            tempTasksIdx += 1
            if tempTasksIdx >= taskDictionary.count{
                tempTasksIdx = 0
            }
        } else {
            showTask = false
        }
        
        print("showTask \(showTask)")
    }
    
    //функция для получения след. слова
    func nextWord() -> String {
        let next_word = tempLocalDictionary[tempWordIdx]
        
        checkTask()
        
        tempWordIdx += 1
        if tempWordIdx >= tempLocalDictionary.count{
            tempWordIdx = 0
        }
        
        return next_word
    }
    
}

