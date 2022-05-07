//
//  DictionaryViewController.swift
//  Allias
//
//  Created by user on 03/05/22.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
    }
}

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var EasyWords: UIButton!
    @IBOutlet weak var MediumWords: UIButton!
    @IBOutlet weak var HardWords: UIButton!
    
    @IBOutlet weak var ewCount: UILabel!
    @IBOutlet weak var mvCount: UILabel!
    @IBOutlet weak var hwCount: UILabel!
    
    let localDict = LocalDictionary()
    var commonData = SingletonStruct.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsParametrs(EasyWords)
        buttonsParametrs(MediumWords)
        buttonsParametrs(HardWords)
        
        ewCount.text = String(localDict.wordsArrayEasy.count)
        mvCount.text = String(localDict.wordsArrayMedium.count)
        hwCount.text = String(localDict.wordsArrayHard.count)
    }
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        if sender == EasyWords {
            commonData.tempLocalDictionary = localDict.wordsArrayEasy
        } else if sender == MediumWords {
            commonData.tempLocalDictionary = localDict.wordsArrayMedium
        } else if sender == HardWords {
            commonData.tempLocalDictionary = localDict.wordsArrayHard
        }
        
        self.dismiss(animated: true)
    }
    
    //Отрисоква углов унопок
    func buttonsParametrs(_ obj: UIButton) {
        obj.layer.cornerRadius = obj.bounds.height / 6
        obj.clipsToBounds = true
    }
}
