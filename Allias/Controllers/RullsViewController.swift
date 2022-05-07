//
//  RullsViewController.swift
//  Allias
//
//  Created by user on 03/05/22.
//

import UIKit

class RullsViewController: UIViewController {

    @IBAction func backButtonAction(_ sender: UIButton) {
        presentVC(identifierOfVC: "MainStoryboard")
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
