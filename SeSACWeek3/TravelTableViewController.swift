//
//  TravelTableViewController.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/14/25.
//

import UIKit

struct Travel {
    let name: String
    let overview: String
    let date: String
    let like: Bool
}

class TravelTableViewController: UITableViewController {

    let nickname = "고래밥" //공간을 하나만 만들어두고 가져다 쓰는게 효율적이지 매번 고래밥 공간을 만드는 것보다. DateFormatter() 얘도 마찬가지
    //과제 피드백
    let format = DateFormatter() //셀 생성시 cellForRowAt에서는 DateFormatter도 하나씩 같이 생성됨..그럴 필요가 있나 : 그래서 cellForRowAt에 쓰는 것보다  여기에 쓰는게 효율적 :연산비용, 인스턴스 생성비용이 큰 DateFormatter같은 애는 특히 여기에 쓰는게 나아
    
    //구조체 활용해보자
    let travel = [
        Travel(name: "서울", overview: "선유도공원 좋아요", date: "250401", like: false),
        Travel(name: "서울1", overview: "선dfa좋아요", date: "250301", like: false),
        Travel(name: "서울2", overview: "ddd원 좋아요", date: "250201", like: true),
        Travel(name: "서울3", overview: "선유도공원 좋아요", date: "250501", like: false),
        Travel(name: "서울4", overview: "df 좋아요", date: "251101", like: false),
        Travel(name: "서울5", overview: "선유df원 좋아요", date: "251201", like: false)
        ]
    
    
    
    
    //"TravelTableViewCell"가 반복되는게 찝집해 : 휴먼에러 발생 가능성 업 //그래서 아래처럼
    //let identifier = "TravelTableViewCell" //클래스에서 선언했으니까 얘는 인스턴스 프로퍼티
    //근데... 인스턴스 프로퍼티로 만들면 identifier의 공간 생성이 너무 중복됨
    //그래서 하나의 공간으로 만들자
    //static let identifier = "TravelTableViewCell"
    //TravelTableViewCell에 static 놓고(셀의 이름이니까 셀에 두는게 보기 좋으니까) TravelTableViewCell.identifier(타입 프로퍼티 접근 방법)로 사용
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기존 방법처럼 테이블뷰 만들고 빌드하면 스레드에러 발생 : 셀 등록이 안되어 있어서
        //별도 셀(XIB)을 원래 셀 자리에 등록해주는 과정이 필요
        //XIB셀로 구성하는 순간 "등록" 과정 필수
        let xib = UINib(nibName: TravelTableViewCell.identifier, bundle: nil) //테이블뷰셀의 파일명, nil(같은 파일 내에서 가져오는 거라 불필요한 과정: 다른 파일에 있다면 위치 설정 필요)
        tableView.register(xib, forCellReuseIdentifier: TravelTableViewCell.identifier) //identifier
        
        tableView.rowHeight = UITableView.automaticDimension //유동적 높이 설정
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
        
        //let row = travel[indexPath.row] //반복을 줄이는 방법
        //cell.configureTravelLabel(row: row) //함수 호출로 TravelTableViewCell와 업무분배
        //cell.configureBackground(row: row)
        //cell.configure(row: row) //row값 보내는 것도 반복되는게 싫어서 3개 함수를 하나의 함수로 합치는것도 좋아
        cell.configure(row: travel[indexPath.row]) //위 호출한 3개의 함수도 하나의 함수로 합쳐서 아예 한줄로 더 줄이기
        
        cell.travelLabel.text = "\(nickname)"
        
        //cell.travelLabel.text = "dddddgsjddgsjdjdjdjjdjddgsjdjdjdjjdjddgsjdjdjdjjdjdjdjdjjdjdjdjdjdjdj" //automaticDimension 테스트
        
        format.dateFormat = "yy년 MM월 dd일 hh시"
        
        let value = format.string(from: Date())
        //cell.dateLabel.text = value
        //cell.dateLabel.text = row.name
        
//        if travel[row].like {
//            cell.backgroundColor = .orange
//        } else {
//            cell.backgroundColor = .clear
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return 100
        
        //셀높이를 유동적으로 만드는 법
        //테이블뷰의 "automaticDimension":프로퍼티이름 같은거(self-sizing cell, expandable cell, dynamic cell)
        return UITableView.automaticDimension //현재는 글자의 높이 만큼만 나옴 //길게 내용을 넣어도 ...으로 나옴
        //automaticDimension가 적용되기 위한 2가지 조건
        //조건1. numberofLines를 0으로 설정해줘야함: 몇줄로 보여질지 무한대로 설정해줘야 자동으로 높이가 적용됨
        //조건2. 레이아웃이 잘 맞아떨어져야한다는 전제가 필수! 레이아웃에 따라 오토메틱디멘션이 잘 적용되기도 안되기도.:
        //지금은 높이가 늘어날 하나의 레이블을 기준으로 나머지 오브젝트들의 높이는 고정해두고 레이아웃을 연습해보자
        //여백기준으로 주변 오브젝트의 높이를 고정값으로 딱 잡아서 높이가 늘어날 애를 알수 있게 해줌: 셀의 높이가 늘어남에 따라 유동적으로 높이가 변할 레이블을 알게 해주는 레이아웃이 필요
        /*
        if indexPath.row < 3 {
            return UITableView.automaticDimension
        } else {
            return 100
        }
        */
        //유동적이지 않고 다 고정된 높이라면 "뷰디드로드에 한줄로" 프로퍼티 사용
    }

}
