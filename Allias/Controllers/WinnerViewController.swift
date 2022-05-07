//
//  WinnerViewController.swift
//  Allias
//
//  Created by Артем Оголец on 07.05.2022.
//

import UIKit

class WinnerViewController: UIViewController {
    
    let commonData = SingletonStruct.shared

    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var congratulViuew: UILabel!
    @IBOutlet weak var playAgainOutlet: UIButton!
    @IBOutlet weak var teamScoreLabel: UILabel!
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        resetData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congratulationsLabel.alpha = 1
        teamScoreLabel.alpha = 1
        congratulationsLabel.text = "Congratulations! The winner is\n \(commonData.teamArray[commonData.activCommandIdx])!"
        teamScoreLabel.text =  "Your score is:\n \(commonData.teamDictionary[commonData.teamArray[commonData.activCommandIdx]]!)"
    }
    
    func resetData() {
        commonData.roundTime = 60
        commonData.wordCount = 20
        commonData.howOftenTask = 3
        commonData.teamArray = [String]()
        commonData.teamDictionary = [String: Int]()
        commonData.activCommandIdx = 0
        presentVC(identifierOfVC: "MainStoryboard")
    }
    

    func presentVC(identifierOfVC: String){
        let main = UIStoryboard(name: "Main", bundle: nil)
        let destination = main.instantiateViewController(withIdentifier: identifierOfVC)
        destination.modalPresentationStyle = .fullScreen
        destination.modalTransitionStyle = .crossDissolve
        self.present(destination, animated: true, completion: nil)

    }

}
