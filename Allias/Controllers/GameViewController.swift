//
//  GameViewController.swift
//  Allias
//
//  Created by user on 03/05/22.
//
import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    @IBOutlet weak var WordsButton: UIButton!
    @IBOutlet weak var PrevWordsButton: UIButton!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var TaskLabel: UILabel!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var YesBotton: UIButton!

    
    
    
    @IBAction func yesActionButton(_ sender: UIButton) {
        
    }
    
    var timer = Timer()
    var player: AVAudioPlayer?
    
    var commonData = SingletonStruct.shared
    
    var countPoints: Int = 0
    var secondsPassed : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        buttonsParametrs(WordsButton)
        buttonsParametrs(PrevWordsButton)
        
        wordsButtonTextCustomize()
        
        //Получение первого слова
        WordsButton.setTitle(commonData.nextWord(), for: .normal)
        
        //Загрузка таймера
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //Обработка кнопок ДА/НЕТ
    @IBAction func clickOnButton(_ sender: UIButton) {
        
        if sender == NoButton {
            playSound("no")
            if commonData.showTask {
                countPoints -= 3
            } else {
                countPoints -= 1
            }
        } else if sender == YesBotton {
            playSound("yes")
            if commonData.showTask {
                countPoints += 3
            } else {
                countPoints += 1
            }
        }
        
        // Определение следующего слова
        WordsButton.setTitle(commonData.nextWord(), for: .normal)
        
        if commonData.showTask {
            TaskLabel.text = commonData.taskDictionary[commonData.tempTasksIdx]
            TaskLabel.alpha = 1
        } else {
            TaskLabel.alpha = 0
        }

    }
    
    //Проигрывание музыки
    func playSound(_ soundCode: String) {
        //поиск файла по URL
        guard let url = Bundle.main.url(forResource: soundCode, withExtension: "mp3") else { return }
        
        do {
            //включаем звук, если телефон в вибро
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    //Отрисовка углов унопок
    func buttonsParametrs(_ obj: UIButton) {
        obj.layer.cornerRadius = obj.bounds.height / 6
        obj.clipsToBounds = true
        
    }
    
    
    @objc func updateTimer() {
        secondsPassed += 1
        let nTempProcess = secondsPassed / Float(commonData.roundTime)
        
        if secondsPassed <= Float(commonData.roundTime) {
            ProgressBar.progress = nTempProcess
        } else {
            timer.invalidate()
            
            print("Index is \(commonData.activCommandIdx)")
            
            //Выдаем очки комманде
            commonData.teamDictionary[commonData.teamArray[commonData.activCommandIdx]]! += countPoints
            // alert joke
            NewApi.shared.dataTask(urlStr: NewApi.shared.urlString) { data in
                
                DispatchQueue.main.async {
                    if let data = data {
                        let alert = UIAlertController(title: "\(data.setup)", message: "\(data.punchline)", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "It was fun)", style: UIAlertAction.Style.default, handler: { _ in
                            if self.commonData.teamDictionary[self.commonData.teamArray[self.commonData.activCommandIdx]]! >= self.commonData.wordCount {
                                self.presentVC(identifierOfVC: "WinnerStoryboard")
                            } else {
                                self.presentVC(identifierOfVC: "GameInfoStoryboard")
                            }
                        }))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        
            //             Возращение на GameInfoView или WinnerView
                        if self.commonData.teamDictionary[self.commonData.teamArray[self.commonData.activCommandIdx]]! >= self.commonData.wordCount {
                            self.presentVC(identifierOfVC: "WinnerStoryboard")
                        } else {
                            self.presentVC(identifierOfVC: "GameInfoStoryboard")
                        }
                    }
                }
                
            }
            
          
            
            //Cмена активной команды
            if commonData.activCommandIdx == commonData.teamArray.count - 1{
                commonData.activCommandIdx = 0
            } else {
                commonData.activCommandIdx += 1
            }
        }
    }
    
    //Наастройка текста слов
    func wordsButtonTextCustomize() {
        WordsButton.titleLabel?.numberOfLines = 3
        WordsButton.titleLabel?.lineBreakMode = .byWordWrapping
        WordsButton.titleLabel?.textAlignment = .center
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

