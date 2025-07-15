//
//  TransitionViewController.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/15/25.
//

import UIKit

class TransitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func PresentButtonClicked(_ sender: UIButton) {
        
        //1. 어떤 스토리보드에: "메인"스토리보드에
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 어떤 뷰컨을: 설정한 스토리보드 아이디(GreenViewController) : GreenViewController 와 연결하겟다(as) //스토리보드 ID 스펠링 주의!
        //let c = GreenViewController() :같은 의미
         let vc = storyboard.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        
        
        
        //내일 예고 :  "값 전달"
        //그럼 그린뷰에 대한 설정도 가능할까? //왜 가능하지?
        vc.view.backgroundColor = .yellow
        //뷰컨에서 아웃렛이 생성이 늦게 됨 : 레이블같은 아웃렛을 가져오면 런타임오류가 발생해야 되는게 맞는데..............오류발생안하고 잘 됨..........?
        vc.testLabel.text = "Test"
        vc.testLabel.backgroundColor = .purple
        //위에 vc.view.backgroundColor = .yellow를 주석처리 하고 실행 하면 정상적으로 런타임오류 발생함!
        
        
        
        //2.5 전환할때: 애니메이션(transiton), presentation 설정 - 선택옵션
        vc.modalPresentationStyle = .fullScreen //풀스크린은 다시 전화면으로 돌아갈 수 없어서 코드로 설정해주기:버튼 만들어서 돌아가게 해주기 present 짝꿍은 dismiss push는 pop:짝꿍은 항상 셋트로 쓰여야함!
        
        vc.modalTransitionStyle = .flipHorizontal
        //3. (어떤 방식으로 push or present) 전환 할지
        present(vc, animated: true)
        
    }
    
    @IBAction func pushButtonClicked(_ sender: UIButton) {
        
        //1. 어떤 스토리보드에: "메인"스토리보드에
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 어떤 뷰컨을 //스토리보드 ID 스펠링 주의!
        let vc = storyboard.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
        //3. (어떤 방식으로 push or present) 전환 할지
        //우측 등장은 "네비컨이 필수!" 그래서 아래 푸쉬도 네비컨에 있음
        navigationController?.pushViewController(vc, animated: true)
        //위아래 같은 의미:옵셔널
//        if navigationController != nil {
//            navigationController!.pushViewController(vc, animated: true)
//        }
        //중요) 만약 엔트리 포인트가 뷰컨에 달려잇다면 "네비게이션컨트로러가 없다"(nil)는 뜻이어서 push가 작동해주지 않음!
        
    }
    
    
}
