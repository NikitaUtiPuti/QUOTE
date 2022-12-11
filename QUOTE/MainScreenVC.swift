//
//  MainScreenVC.swift
//  QUOTE
//
//  Created by Никита Зюзин on 06.11.2022.
//

import UIKit

class MainScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "backToMainScreenVC" else { return }
    }
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
}

