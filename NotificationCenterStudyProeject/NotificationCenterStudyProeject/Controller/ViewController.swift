//
//  ViewController.swift
//  NotificationCenterStudyProeject
//
//  Created by 김우성 on 2021/04/28.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Property
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "첫 번째 페이지"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 관찰자를 등록한다.
        NotificationCenter.default.addObserver(self, selector: #selector(handleChageLabelText), name: .changeLabelText, object: nil)
        
        configureUI()
        
    }

    // MARK: - Helpers
    
    /// NotificationCenter에서 호출 시, 호출될 콜백메소드
    @objc
    func handleChageLabelText() {
        self.firstLabel.text = "첫 번째 레이블이 변경되었습니다."
    }
    
    /// UI 구현을 위한 메소드
    func configureUI() {
        
        view.addSubview(firstLabel)
        firstLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                             height: view.frame.height * 0.5)
        firstLabel.center = view.center
        
    }
}

// Notification 명명
extension Notification.Name {
    static let changeLabelText = Notification.Name("changeLabel")
}

