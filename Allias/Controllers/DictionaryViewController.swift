//
//  DictionaryViewController.swift
//  Allias
//
//  Created by user on 03/05/22.
//

import UIKit


class DictionaryViewController: UIViewController {
    
    let localDict = LocalDictionary()
    var commonData = SingletonStruct.shared
    
    @IBOutlet weak var EasyWords: UIButton!
    @IBOutlet weak var MediumWords: UIButton!
    @IBOutlet weak var HardWords: UIButton!
    
    @IBOutlet weak var ewCount: UILabel!
    @IBOutlet weak var mvCount: UILabel!
    @IBOutlet weak var hwCount: UILabel!
    
    
    @IBAction func easyWordsActionButton(_ sender: UIButton) {
        commonData.tempLocalDictionary = LocalDictionary().wordsArrayHard.shuffled()
        presentVC(identifierOfVC: "OptionStoryboard")
    }
    
    @IBAction func mediumWordsActionButton(_ sender: UIButton) {
        commonData.tempLocalDictionary = LocalDictionary().wordsArrayMedium.shuffled()
        presentVC(identifierOfVC: "OptionStoryboard")
    }
    
    @IBAction func hardWordsActionButton(_ sender: UIButton) {
        commonData.tempLocalDictionary = LocalDictionary().wordsArrayHard.shuffled()
        presentVC(identifierOfVC: "OptionStoryboard")

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsParametrs(EasyWords)
        buttonsParametrs(MediumWords)
        buttonsParametrs(HardWords)
        
        ewCount.text = String(localDict.wordsArrayEasy.count)
        mvCount.text = String(localDict.wordsArrayMedium.count)
        hwCount.text = String(localDict.wordsArrayHard.count)
    }
    

    
    //Отрисоква углов унопок
    func buttonsParametrs(_ obj: UIButton) {
        obj.layer.cornerRadius = obj.bounds.height / 6
        obj.clipsToBounds = true
    }
    
    //Перемещение по экранам
    func presentVC(identifierOfVC: String){
        let main = UIStoryboard(name: "Main", bundle: nil)
        let destination = main.instantiateViewController(withIdentifier: identifierOfVC)
        destination.modalPresentationStyle = .fullScreen
        destination.modalTransitionStyle = .crossDissolve
        self.present(destination, animated: true, completion: nil)

    }
}
