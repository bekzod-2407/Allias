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
    
    @IBAction func roundTimeSlider(_ sender: UISlider) {
        singleShared.roundTime = Int(sender.value)
        roundTimeValueLabel.text = String(singleShared.roundTime)
    }
    
    @IBAction func wordCountSLider(_ sender: UISlider) {
        singleShared.wordCount = Int(sender.value)
        wordCountValueLabel.text = String(singleShared.wordCount)
    }
    
    @IBAction func tasksSlider(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
