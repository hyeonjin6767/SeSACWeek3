//
//  TravelTableViewCell.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/14/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    
    static let identifier = "TravelTableViewCell"
    
    //let color = Color() //빈도수를 줄이기 위해 static으로 바꾸자

    
    @IBOutlet var travelLabel: UILabel! //let travelLabel = UILabel() :얘도 인스턴스

    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        travelLabel.backgroundColor = Color.jackRed //static은 바로 호출 가능
        travelLabel.text = "테스트"
        travelLabel.font = .boldSystemFont(ofSize: 17)
        
        //밑에 함수에서 row값을 받을 필요 없는 애들은 awakeFronNib에
        travelLabel.numberOfLines = 0
        travelLabel.backgroundColor = .white
        
    }
    
    //row값(변동값)을 받아야 하는 애들은 매개변수 있는 함수에 모아
    func configure(row: Travel) {
        
        dateLabel.text = row.name
        dateLabel.backgroundColor = .clear
       
        if row.like {
            backgroundColor = .orange
        } else {  //모든 셀의 배경에 대해서 대응 //"사용자의 선택"에 따라 바뀌는 건 이프문 cf.prepareForReuse()
            backgroundColor = .clear
        }
        
        travelLabel.text = row.overview
       
    }
    override func prepareForReuse() { //여기서 초기화 되는건 사용자 입장에서 자유도가 없는것(선택권이 없음) ex.카톡프로필 이미지를 사용자가 설정하지 않으면 기본이미지로 되어 있는데 이런건 사용자가 기본이미지를 쓰겠다는 선택권이 있는 건 아니니까(개발자가 지정) 이런건 이프문에 넣는것보단 prepareForReuse()에 두는게 낫지 않은가
        super.prepareForReuse()
        //위에 else대신 prepareForReuse()도 사용 가능
        backgroundColor = .clear
    }
    /*
    func configureBackground(row: Travel) {
        
        if row.like {
            backgroundColor = .orange
        } else {
            backgroundColor = .clear
        }
    }
    
    //컨트롤뷰에서 하는일 여기서 나눠서 시키자
    func configureTravelLabel(row: Travel) {
        travelLabel.text = row.overview
        travelLabel.numberOfLines = 0
        travelLabel.backgroundColor = .white
    }
     */
}
