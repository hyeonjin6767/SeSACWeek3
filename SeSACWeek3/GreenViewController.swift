//
//  GreenViewController.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/15/25.
//

import UIKit

class GreenViewController: UIViewController {

    
    
    @IBOutlet var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testLabel.text = "Jack"
//        testLabel.backgroundColor = .red

       
    }
    

    @IBAction func closeButtonClicked(_ sender: UIButton) {
        
        //어느 화면으로 다시 돌아갈건지 //컨트롤러에 기록이 다 남아 있으므로 가져오면 됨
        dismiss(animated: true) //짝꿍 바뀌지 않게 주의!
        //navigationController?.popViewController(animated: true)

        
    }
    

}
