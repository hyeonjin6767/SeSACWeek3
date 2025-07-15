//
//  GrayViewController.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/15/25.
//

import UIKit

class GrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true) //짝꿍 바뀌지 않게 주의!
        //dismiss(animated: true)
    }
    
    
}
