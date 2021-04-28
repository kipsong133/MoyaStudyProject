//
//  ViewController02.swift
//  NotificationCenterStudyProeject
//
//  Created by 김우성 on 2021/04/28.
//

import UIKit

class ViewController02: UIViewController {
    
    // MARK: - Property
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "두 번째 페이지"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleChageLabelText), name: .changeLabelText, object: nil)
        
        super.viewDidLoad()
        configureUI()
        
    }

    // MARK: - Helpers
    
    /// NotificationCenter에서 호출 시, 호출될 콜백메소드
    @objc
    func handleChageLabelText() {
        self.label2.text = "두 번째 레이블이 변경되었습니다."
    }
    
    func configureUI() {
        
        view.addSubview(label2)
        label2.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                             height: view.frame.height * 0.5)
        label2.center = view.center
        
    }
}
