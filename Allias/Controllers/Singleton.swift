//
//  Singleton.swift
//  Allias
//
//  Created by Артем Оголец on 04.05.2022.
//

import Foundation

final class SingletonStruct {
    
    static var shared = SingletonStruct()
    
    var roundTime: Int = 20
    var wordCount: Int = 0
    //частота показа задания
    var howOftenTask: Int = 3
    //показывать задание?
    var showTask: Bool = false
    
    //!!!!!!!(нужна функция на заполнение или заполение из DictionaryView)
    //массив слов выбранного словаря
    //var tempLocalDictionary: Array<String> = []
    var tempLocalDictionary = ["кран", "лопата", "овца", "учитель", "человек", "завтрак", "дневник", "паровоз"]
    var tempWordIdx: Int = 0
    
    //массив действий к словам
    //var taskDictionary: Array<String> = []
    var taskDictionary = ["Стоя на одной ноге", "Не используя глаголы", "Не говори, а покажи"]
    var tempTasksIdx: Int = 0
    
    //команды
    var teamArray: Array = ["❤️ Lovers", "💀 DeathEaters", "🤖 Robots", "🧔🏻‍♂️ Mens", "👯‍♀️ Women"]
    var teamDictionary: Dictionary = ["❤️ Lovers": 0, "💀 DeathEaters": 0, "🤖 Robots": 0, "🧔🏻‍♂️ Mens": 0, "👯‍♀️ Women": 0]
    //текущая активная комманда
    var activCommandIdx: Int = 0
    
    
    //функция для определения частоты показа задания
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
    
    
    //функция для смены активной команды
    func setActivCommand (_ commandName: String){
        activCommandIdx += 1
        
        if activCommandIdx > teamArray.count{
            activCommandIdx = 0
        }
    }
    
    
    //функция для обновления баллов команды
    func addPoints(_ tempPoints: Int){
        teamDictionary[teamArray[activCommandIdx]] = (teamDictionary[teamArray[activCommandIdx]]) ?? 0 + tempPoints
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

