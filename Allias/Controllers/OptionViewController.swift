//
//  OptionViewController.swift
//  Allias
//
//  Created by user on 03/05/22.
//

import UIKit

class OptionViewController: UIViewController {
    
    var singleShared = SingletonStruct.shared
        
    @IBOutlet weak var roundTimeValueLabel: UILabel!
    @IBOutlet weak var wordCountValueLabel: UILabel!
        
    @IBAction func backToRootControllerButton(_ sender: UIButton) {
        presentVC(identifierOfVC: "MainStoryboard")
    }
    
    @IBAction func toDictionaryControllerButton(_ sender: UIButton) {
        presentVC(identifierOfVC: "DictionaryStoryboard")
    }
    
    @IBAction func roundTimeSlider(_ sender: UISlider) {
        singleShared.roundTime = Int(sender.value)
        roundTimeValueLabel.text = String(singleShared.roundTime)
    }
    
    @IBAction func wordCountSLider(_ sender: UISlider) {
        singleShared.wordCount = Int(sender.value)
        wordCountValueLabel.text = String(singleShared.wordCount)
    }
    
    @IBAction func tasksSlider(_ sender: UISlider) {
        singleShared.changeOftenTask(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
