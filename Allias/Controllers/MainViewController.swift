//
//  ViewController.swift
//  Allias
//
//  Created by user on 03/05/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func newGameActionButton(_ sender: UIButton) {
    presentVC(identifierOfVC: "GameInfoStoryboard")
    }
    
    @IBAction func gameOptionAtcionButton(_ sender: UIButton) {
        presentVC(identifierOfVC: "OptionStoryboard")
    }
    
    @IBAction func rulesActionButton(_ sender: UIButton) {
        presentVC(identifierOfVC: "RulesStoryboard")
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

